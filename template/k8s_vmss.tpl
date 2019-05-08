{
  "apiVersion": "vlabs",
  "properties": {
    "orchestratorProfile": {
      "orchestratorType": "Kubernetes",
      "orchestratorRelease": "1.14",
       "orchestratorVersion": "1.14.0",
      "kubernetesConfig": {
        "useManagedIdentity": true
      }
    },
    "masterProfile": {
      "count": 1,
      "dnsPrefix": "a323232",
      "vmSize": "Standard_D2s_v3"
    },
    "agentPoolProfiles": [
      {
        "name": "agentpool1",
        "count": 3,
        "vmSize": "Standard_D2s_v3",
        "availabilityProfile": "VirtualMachineScaleSets",
        "storageProfile": "ManagedDisks"
      }
    ],
    "linuxProfile": {
      "adminUsername": "aksadmin",
      "ssh": {
        "publicKeys": [
          {
            "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDuaZlaEQ7f0JhYlThZ4DKnkEyfwDftdXwRDuVoBm7rUCO8y/o262bJZ/sar4ugq+mBsxfGQLNH8+sf+twCigacnXbVBT48SfTdoF1jxeJcJc2jIBnVY8/MBLVyBDi/tF6/DTQvHqwk0WY1KihyNvS6GuxgBYeElHnQwKj2uAfjaCh0s2RY1lWvh4tFHVPt2Zp9XV7lUV8XUtQKEf4hrhACdb3CKzI9TXMfa23oZN5aGGQHJDlTYDTZqIplgdPw5Mu4YOstRPb02674l50j9aCPajQmA0/C79C/D7rAwUCJh2GTD4F5SFpVFWPS7d8iI3OVjN+6XexRVFk/Anmve4PIkq+m0nwEqMg4F70XY9hYZIx8rt+3XzupsHLLfQRIvwJTtEKV1K16XEFf9GmU95KeVsj3l1vwn64ofbDOLw9IqW8eXMJ692I5xOoispKu+sIdtY2/jXuKiHyxeUjouPpN5jKwTL835U/De0ZCKQ0UnnynfjnmWqx/EQkDZsf8Ti6jvoBBnTNYm4rcGuXa+Qpp8eiqP/8N7v4/hDVx+NlcMTJPWooHJ8xp/qbnHYBMt5ATz+swEr3vkW5aG7AKr2hgep65EPjrJlb/pBzTXIro3BNz6sqtIyT1NJZGyVBh4obVFBF6RgWWROyI/xF3/bKiFKtsYjMmLezXzxJdCAlzNw== twix-team@k8s_clusters"
          }
        ]
      }
    }
  }
}