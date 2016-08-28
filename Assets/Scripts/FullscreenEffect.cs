using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class FullscreenEffect : MonoBehaviour {

    public Material Effect;

    void Update() {
        if (Effect) {
            Effect.SetFloat("_RotOffset", (Time.realtimeSinceStartup * 720) % 360);
        }
    }

    public void OnRenderImage(RenderTexture source, RenderTexture destination) {
        if (Effect != null) {
            Graphics.Blit(source, destination, Effect);
        } else {
            Graphics.Blit(source, destination);
        }
    }
}