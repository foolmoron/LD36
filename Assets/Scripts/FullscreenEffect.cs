using UnityEngine;
using System.Collections;

public class FullscreenEffect : MonoBehaviour {

    public Material Effect;

    void Start() {

    }

    public void OnRenderImage(RenderTexture source, RenderTexture destination) {
        Graphics.Blit(source, destination, Effect);
    }
}
