Shader "Extra/ChromaticAbberation"
{
  Properties
  {
    _MainTex("Texture", 2D) = "white" {}
	_Amount("Amount", Range(0, 10)) = 0
	_RotOffset("RotationOffset", Range(0, 360)) = 0
  }
  SubShader
  {
	Blend One Zero
    // No culling or depth
    Cull Off ZWrite Off ZTest Always

    Pass
    {
      CGPROGRAM
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"

      struct appdata
      {
        float4 vertex : POSITION;
        float2 uv : TEXCOORD0;
      };

      struct v2f
      {
        float2 uv : TEXCOORD0;
        float4 vertex : SV_POSITION;
      };

      v2f vert (appdata v)
      {
        v2f o;
        o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
        o.uv = v.uv;
        return o;
      }

      sampler2D _MainTex;
      float _Amount;
	  float _RotOffset;

      fixed4 frag (v2f i) : SV_Target
      {
		float deg2rad = 3.1415 / 180;
		float rAngle = (30 + _RotOffset) * deg2rad;
		float bAngle = (150 + _RotOffset) * deg2rad;
		float gAngle = (270 + _RotOffset) * deg2rad;

		float amount = _Amount / 500;
        float4 rSample = tex2D(_MainTex, i.uv - (amount * float2(cos(rAngle), sin(rAngle))));
        float4 gSample = tex2D(_MainTex, i.uv - (amount * float2(cos(bAngle), sin(bAngle))));
        float4 bSample = tex2D(_MainTex, i.uv - (amount * float2(cos(gAngle), sin(gAngle))));

		float lerp = 1 + (_Amount / 10) * (_Amount / 10);
        return lerp * float4(rSample.r, gSample.g, bSample.b, 1.0);
      }
      ENDCG
    }
  }
}