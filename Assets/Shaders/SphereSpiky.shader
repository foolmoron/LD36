// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32864,y:32717,varname:node_3138,prsc:2|emission-7241-RGB,voffset-3574-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32471,y:32812,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_NormalVector,id:1788,x:32303,y:33094,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:3574,x:32513,y:33040,varname:node_3574,prsc:2|A-97-OUT,B-1788-OUT;n:type:ShaderForge.SFN_Multiply,id:8176,x:32079,y:33066,varname:node_8176,prsc:2|A-4279-OUT,B-9546-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9692,x:31904,y:32864,ptovrint:False,ptlb:Amplitude,ptin:_Amplitude,varname:node_9692,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Frac,id:9546,x:32481,y:33450,varname:node_9546,prsc:2|IN-4155-OUT;n:type:ShaderForge.SFN_Sin,id:8508,x:32136,y:33527,varname:node_8508,prsc:2|IN-708-OUT;n:type:ShaderForge.SFN_Multiply,id:4155,x:32281,y:33527,varname:node_4155,prsc:2|A-8508-OUT,B-7176-OUT;n:type:ShaderForge.SFN_Vector1,id:7176,x:32105,y:33662,varname:node_7176,prsc:2,v1:43758.55;n:type:ShaderForge.SFN_ValueProperty,id:3917,x:31641,y:33461,ptovrint:False,ptlb:Seed,ptin:_Seed,varname:node_3917,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Dot,id:5909,x:31892,y:33662,varname:node_5909,prsc:2,dt:0|A-7274-OUT,B-3140-OUT;n:type:ShaderForge.SFN_NormalVector,id:7274,x:31707,y:33623,prsc:2,pt:False;n:type:ShaderForge.SFN_Vector3,id:3140,x:31707,y:33791,varname:node_3140,prsc:2,v1:12.9898,v2:78.233,v3:111.78;n:type:ShaderForge.SFN_Multiply,id:708,x:31990,y:33504,varname:node_708,prsc:2|A-6943-OUT,B-5909-OUT;n:type:ShaderForge.SFN_Add,id:6943,x:31813,y:33477,varname:node_6943,prsc:2|A-3917-OUT,B-8765-OUT;n:type:ShaderForge.SFN_Vector1,id:8765,x:31619,y:33546,varname:node_8765,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:97,x:32286,y:32946,varname:node_97,prsc:2|A-8176-OUT,B-8176-OUT,C-8176-OUT,D-9692-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4279,x:31783,y:33079,ptovrint:False,ptlb:Phase,ptin:_Phase,varname:node_4279,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;proporder:7241-9692-3917-4279;pass:END;sub:END;*/

Shader "Shader Forge/SphereSpiky" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _Amplitude ("Amplitude", Float ) = 1
        _Seed ("Seed", Float ) = 0
        _Phase ("Phase", Float ) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma target 2.0
            uniform float4 _Color;
            uniform float _Amplitude;
            uniform float _Seed;
            uniform float _Phase;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float3 normalDir : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float node_8176 = (_Phase*frac((sin(((_Seed+1.0)*dot(v.normal,float3(12.9898,78.233,111.78))))*43758.55)));
                v.vertex.xyz += ((node_8176*node_8176*node_8176*_Amplitude)*v.normal);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 emissive = _Color.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma target 2.0
            uniform float _Amplitude;
            uniform float _Seed;
            uniform float _Phase;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float node_8176 = (_Phase*frac((sin(((_Seed+1.0)*dot(v.normal,float3(12.9898,78.233,111.78))))*43758.55)));
                v.vertex.xyz += ((node_8176*node_8176*node_8176*_Amplitude)*v.normal);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
