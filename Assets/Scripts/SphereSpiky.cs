using UnityEngine;
using System.Collections;

public class SphereSpiky : MonoBehaviour {

    [Range(0, 15)]
    public float Amplitude;
    [Range(-10, 10)]
    public float PhaseMult;
    float t;

    Renderer childRenderer;

    void Start() {
        childRenderer = transform.FindChild("Spikes").GetComponent<Renderer>();
    }
    
    void Update() {
        var s = ScreenPos.FromTransform(transform, Camera.main);
        PhaseMult = Mathf.Lerp(-10, 10, s.x);
        Amplitude = Mathf.Lerp(0, 15, s.y);
        childRenderer.material.SetFloat("_Amplitude", Amplitude);
        t += Time.deltaTime * PhaseMult;
        childRenderer.material.SetFloat("_Phase", Mathf.Abs(Mathf.Sin(t)));
    }
}
