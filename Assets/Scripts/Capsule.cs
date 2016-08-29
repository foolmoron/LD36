using UnityEngine;
using System.Collections;
using UnityStandardAssets.ImageEffects;

public class Capsule : MonoBehaviour {

    Material effect;
    float r;
    
    void Start() {
        effect = Camera.main.GetComponent<FullscreenEffect>().Effect;
    }
    
    void Update() {
        var s = ScreenPos.FromTransform(transform, Camera.main);
        effect.SetFloat("_Amount", Mathf.Lerp(0, 10, s.y));
        r = (r + (Time.deltaTime * Mathf.Lerp(-1440, 1440, s.x)) + 360) % 360;
        effect.SetFloat("_RotOffset", r);
    }
}
