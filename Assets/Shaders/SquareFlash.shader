// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:33185,y:32686,varname:node_4795,prsc:2|emission-6486-OUT;n:type:ShaderForge.SFN_Multiply,id:2393,x:32495,y:32793,varname:node_2393,prsc:2|A-2053-RGB,B-5498-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:31710,y:32735,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:8793,x:31107,y:32942,varname:node_8793,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:3000,x:31321,y:32968,varname:node_3000,prsc:2|A-8793-UVOUT,B-2406-OUT;n:type:ShaderForge.SFN_Vector1,id:6659,x:31352,y:33117,varname:node_6659,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:8386,x:31528,y:32968,varname:node_8386,prsc:2|A-3000-OUT,B-6659-OUT;n:type:ShaderForge.SFN_Abs,id:3159,x:31710,y:32968,varname:node_3159,prsc:2|IN-8386-OUT;n:type:ShaderForge.SFN_Vector1,id:2406,x:31107,y:33117,varname:node_2406,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_ComponentMask,id:730,x:31891,y:32968,varname:node_730,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-3159-OUT;n:type:ShaderForge.SFN_Max,id:4814,x:32070,y:32978,varname:node_4814,prsc:2|A-730-R,B-730-G;n:type:ShaderForge.SFN_Subtract,id:5498,x:32269,y:32978,varname:node_5498,prsc:2|A-6393-OUT,B-4814-OUT;n:type:ShaderForge.SFN_Vector1,id:6393,x:32070,y:33131,varname:node_6393,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:2206,x:32732,y:32704,varname:node_2206,prsc:2|A-9482-OUT,B-2393-OUT;n:type:ShaderForge.SFN_Multiply,id:9482,x:32495,y:32588,varname:node_9482,prsc:2|A-5327-OUT,B-5498-OUT;n:type:ShaderForge.SFN_Multiply,id:5327,x:32313,y:32588,varname:node_5327,prsc:2|A-2197-OUT,B-7434-OUT;n:type:ShaderForge.SFN_Vector1,id:2197,x:32059,y:32569,varname:node_2197,prsc:2,v1:5;n:type:ShaderForge.SFN_If,id:6486,x:32990,y:32752,varname:node_6486,prsc:2|A-2053-A,B-4334-OUT,GT-2206-OUT,EQ-2206-OUT,LT-3794-OUT;n:type:ShaderForge.SFN_Vector1,id:4334,x:31805,y:32875,varname:node_4334,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:7434,x:32125,y:32645,varname:node_7434,prsc:2|A-2053-A,B-4334-OUT;n:type:ShaderForge.SFN_Multiply,id:3794,x:32792,y:32916,varname:node_3794,prsc:2|A-2393-OUT,B-9124-OUT;n:type:ShaderForge.SFN_Multiply,id:9124,x:32608,y:32977,varname:node_9124,prsc:2|A-2053-A,B-8856-OUT;n:type:ShaderForge.SFN_Vector1,id:8856,x:32417,y:33072,varname:node_8856,prsc:2,v1:1;pass:END;sub:END;*/

Shader "Shader Forge/SquareFlash" {
    Properties {
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma target 2.0
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float node_4334 = 0.5;
                float node_6486_if_leA = step(i.vertexColor.a,node_4334);
                float node_6486_if_leB = step(node_4334,i.vertexColor.a);
                float2 node_730 = abs(((i.uv0+(-0.5))*2.0)).rg;
                float node_5498 = (1.0-max(node_730.r,node_730.g));
                float3 node_2393 = (i.vertexColor.rgb*node_5498);
                float3 node_2206 = (((5.0*(i.vertexColor.a-node_4334))*node_5498)+node_2393);
                float3 emissive = lerp((node_6486_if_leA*(node_2393*(i.vertexColor.a*1.0)))+(node_6486_if_leB*node_2206),node_2206,node_6486_if_leA*node_6486_if_leB);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
