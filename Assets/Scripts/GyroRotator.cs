using UnityEngine;
using System.Collections;

public class GyroRotator : MonoBehaviour {

    public bool Reverse;
    [Range(0, 1)]
    public float ZCutoff = 0.25f;
    [Range(0, 0.5f)]
    public float RotationLerpFactor = 0.375f;
    public float Rotation;
    
    void Update() {
        Input.gyro.enabled = true;

        var gravityAngle = 0f;
        if (Mathf.Abs(Input.gyro.gravity.z) < ZCutoff) {
            var gravity2D = Input.gyro.gravity.to2().normalized;
            gravityAngle = Mathf.Atan2(gravity2D.y, gravity2D.x) * Mathf.Rad2Deg + 90;
        }
        Rotation = Mathf.LerpAngle(Rotation, gravityAngle, RotationLerpFactor);
        transform.rotation = Quaternion.Euler(0, 0, (Reverse ? -1 : 1) * Rotation);
    }
}
