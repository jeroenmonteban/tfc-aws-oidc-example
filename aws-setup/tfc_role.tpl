{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Effect": "Allow",
     "Principal": {
       "Federated": "${oidc_arn}"
     },
     "Action": "sts:AssumeRoleWithWebIdentity",
     "Condition": {
       "StringEquals": {
         "app.terraform.io:aud": "${oidc_client_list}"
       },
       "StringLike": {
         "app.terraform.io:sub": "organization:${tfc_organization}:project:*:workspace:*:run_phase:*"
       }
     }
   }
 ]
}