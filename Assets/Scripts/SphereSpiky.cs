using UnityEngine;
using System.Collections;

public class SphereSpiky : MonoBehaviour {

    public Color Color = Color.white;
    [Range(0, 5)]
    public float Amplitude;

    Renderer thisRenderer;
    Renderer childRenderer;

    void Start() {
        thisRenderer = GetComponent<Renderer>();
        childRenderer = transform.FindChild("Spikes").GetComponent<Renderer>();
    }
    
    void Update() {
        thisRenderer.material.SetColor("_Color", Color);
        childRenderer.material.SetColor("_Color", Color);
        childRenderer.material.SetFloat("_Amplitude", Amplitude);
        childRenderer.material.SetFloat("_Phase", Mathf.Abs(Mathf.Sin(Time.timeSinceLevelLoad)));
    }
}
