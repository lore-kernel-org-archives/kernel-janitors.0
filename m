Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160DC2475DC
	for <kernel-janitors@vger.kernel.org>; Sat,  8 Feb 2025 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739020808; cv=none; b=jZgApLQtOMrm33/NO2FVQHgUF91GYynrAhv6k0V9f7CWcylWjofRSzs2/30zKBSauE83mjo+LKOow+DPbz3zHjt5kOLmzLrEyQI7LaOIgy2kVoH3d3fpJUMnH0PEHATI4TcXOKzcbhEl+2ExDlvKHIFJDij2+1kBJcnlOMfnrI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739020808; c=relaxed/simple;
	bh=Vo64bJtHbjIWsK3Kp7MToORuFs2m3oKcJHh/ZfdIJ9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYtME+OGlAHGXSgiHeDzy/8bgXMtNcfzfAvIMm7TeNXZ15souvm/fNIlNhoa7lZqowgbpqtkfrNjlMuE1TiJTLisVHD/NGuCS4OATlTCxQOiJ3VPxqJ8d6f//rN9/Jnl1/APGhimBW6Fb5FCymsVGg8Iots/nevzc5ljDtFpTn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=flilQo7U; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="flilQo7U"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2b1a9cbfc8dso909739fac.2
        for <kernel-janitors@vger.kernel.org>; Sat, 08 Feb 2025 05:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739020806; x=1739625606; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1J0FYLlEHXe73VzkR6ErKewh5bBLeF9oEbsYh1FHsms=;
        b=flilQo7UvnYutLcEj/3C8SVwhp+T600AfprGQlpxQQCm6krux4ueI7aSOP6F1AcYLE
         644hJq7CvFnPI/P6G4iH8BtdkYkiA1/DaLZCaIt1sYzdiNK/EPn2SN7ujoAkwHw1z/b7
         AIFRnhU/6Rs7iRbqMSmCnMM74Ml7SuiYd2EWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739020806; x=1739625606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J0FYLlEHXe73VzkR6ErKewh5bBLeF9oEbsYh1FHsms=;
        b=iRGtN0uhdkLPRWDAcskCj9D5q8U5OzbeonYk9RaLIIskxSZm16iXHluv9PSUpzKpPD
         GKeT9OZH3vKxu7YVJJkGRjbXRtDoVNukBkMN8EZ2NGBJ7YT6AHAzECjJAYQEtB/UXAxG
         9P/QgnY8JGv62vXEISQhOnd0uC7FPYjFewzHuErsqS+wcKasZaXE4Hv3PhYPIAHHpBCI
         pVVyJJvblWHSwRegCsHdEmcVhdPolltMAbwN6TUdHoeG/hqAwlWUnRCvq6Nug85W/8Kw
         dMGJ163ypuw7SC1CAAj85YPSF/Dqd0HCmVkn9f7GAqpwx7Jru1/wYJJyoc9xeiSMaujn
         IsLA==
X-Forwarded-Encrypted: i=1; AJvYcCVbDnFUVC2aNXSs2i6rwvwtXGu5jBwVRUazEfNif1KUMuTF3CmOQhV2/B+FgFtZSGGmTiPBymDTZ/W3ZJ+/Cm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoe2zVlsKXrmtfIpgmdhzZetxjy23Ng5cfUkX+LADab5bKLLoM
	mAcwp1doMHjCMoL7ZYlB0UZOTPmQGkCQE7GP/TTA7TyY8SNygw/wlfcQhp1GUlf1X1815fu/GNm
	2yTv9w6EltVlE+z+p1nOdbndoTTUNbdXICEBW
X-Gm-Gg: ASbGnctxgVgdAkdVcVpdvnHBEfJXzBKoiMc8GbwWEgsBn3KsXLHq8H9pyvb8i1exK8l
	TVXpGLps4rhW9VlT6VzUlTL2JwM4EYbmuzKNuHc/0VhthHoHH+suprdtqyA1EY1W1JbOGVlU6
X-Google-Smtp-Source: AGHT+IHUDMFMNeFfQLpuCIinoaH8vwun17sJr30ypK/Vql6OT2GgYZmfbd5kAWijhOAl1ZPv5BoaGZSk6pf/1izXE18=
X-Received: by 2002:a05:6870:9d83:b0:2b7:fc95:66e1 with SMTP id
 586e51a60fabf-2b83eccb879mr3749132fac.19.1739020806030; Sat, 08 Feb 2025
 05:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6b081ab-55fe-4d0c-8f69-c5e5a59e9141@stanley.mountain>
In-Reply-To: <a6b081ab-55fe-4d0c-8f69-c5e5a59e9141@stanley.mountain>
From: Selvin Xavier <selvin.xavier@broadcom.com>
Date: Sat, 8 Feb 2025 18:49:53 +0530
X-Gm-Features: AWEUYZnp-AswmT8TAXm8pvK2uC8j2IAW8B4F_BDv_oWdyoQAsMQ3lGMHqKJjoKw
Message-ID: <CA+sbYW1L=RDfw2pgte5Ut6kHqrN_v1_h395+PYYroOpRM6Z3zg@mail.gmail.com>
Subject: Re: [PATCH next] RDMA/bnxt_re: Fix buffer overflow in debugfs code
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006afb79062da155e7"

--0000000000006afb79062da155e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 2:46=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> Add some bounds checking to prevent memory corruption in
> bnxt_re_cc_config_set().  This is debugfs code so the bug can only be
> triggered by root.
>
> Fixes: 656dff55da19 ("RDMA/bnxt_re: Congestion control settings using deb=
ugfs hook")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Selvin Xavier <selvin.xavier@broadcom.com>

Thanks,
Selvin
> ---
>  drivers/infiniband/hw/bnxt_re/debugfs.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/infiniband/hw/bnxt_re/debugfs.c b/drivers/infiniband=
/hw/bnxt_re/debugfs.c
> index f4dd2fb51867..d7354e7753fe 100644
> --- a/drivers/infiniband/hw/bnxt_re/debugfs.c
> +++ b/drivers/infiniband/hw/bnxt_re/debugfs.c
> @@ -285,6 +285,9 @@ static ssize_t bnxt_re_cc_config_set(struct file *fil=
p, const char __user *buffe
>         u32 val;
>         int rc;
>
> +       if (count >=3D sizeof(buf))
> +               return -EINVAL;
> +
>         if (copy_from_user(buf, buffer, count))
>                 return -EFAULT;
>
> --
> 2.47.2
>

--0000000000006afb79062da155e7
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQfAYJKoZIhvcNAQcCoIIQbTCCEGkCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3TMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVswggRDoAMCAQICDHL4K7jH/uUzTPFjtzANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwODE4NDdaFw0yNTA5MTAwODE4NDdaMIGc
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xIjAgBgNVBAMTGVNlbHZpbiBUaHlwYXJhbXBpbCBYYXZpZXIx
KTAnBgkqhkiG9w0BCQEWGnNlbHZpbi54YXZpZXJAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEA4/0O+hycwcsNi4j4tTBav8CvSVzv5i1Zk0tYtK7mzA3r8Ij35v5j
L2NsFikHjmHCDfvkP6XrWLSnobeEI4CV0PyrqRVpjZ3XhMPi2M2abxd8BWSGDhd0d8/j8VcjRTuT
fqtDSVGh1z3bqKegUA5r3mbucVWPoIMnjjCLCCim0sJQFblBP+3wkgAWdBcRr/apKCrKhnk0FjpC
FYMZp2DojLAq9f4Oi2OBetbnWxo0WGycXpmq/jC4PUx2u9mazQ79i80VLagGRshWniESXuf+SYG8
+zBimjld9ZZnwm7itHAZdtme4YYFxx+EHa4PUxPV8t+hPHhsiIjirPa1pVXPbQIDAQABo4IB2zCC
AdcwDgYDVR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAu
Y3J0MEEGCCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29u
YWxzaWduMmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0
cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBA
MD6gPKA6hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2Ey
MDIwLmNybDAlBgNVHREEHjAcgRpzZWx2aW4ueGF2aWVyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAK
BggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU3TaH
dsgUhTW3LwObmZ20fj+8Xj8wDQYJKoZIhvcNAQELBQADggEBAAbt6Sptp6ZlTnhM2FDhkVXks68/
iqvfL/e8wSPVdBxOuiP+8EXGLV3E72KfTTJXMbkcmFpK2K11poBDQJhz0xyOGTESjXNnN6Eqq+iX
hQtF8xG2lzPq8MijKI4qXk5Vy5DYfwsVfcF0qJw5AhC32nU9uuIPJq8/mQbZfqmoanV/yadootGr
j1Ze9ndr+YDXPpCymOsynmmw0ErHZGGW1OmMpAEt0A+613glWCURLDlP8HONi1wnINV6aDiEf0ad
9NMGxDsp+YWiRXD3txfo2OMQbpIxM90QfhKKacX8t1J1oAAWxDrLVTJBXBNvz5tr+D1sYwuye93r
hImmkM1unboxggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWdu
IG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIw
Agxy+Cu4x/7lM0zxY7cwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIKEvwiYAxzrt
phzvga6/eHeL5LklF1Il+PwawEPiIk5NMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI1MDIwODEzMjAwNlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcN
AQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCWdp9QiJ5UM7EkqoS5t8kDgZ+P6/M2
cnoVTc2ZyjjNsIVv4Sy/KQO6PAPSfkjU47Rv1Du2o3fGuPfIQqhAkwS86M/gI2aAdgHImDQ9VpFV
6KskKVeO2wGrzQKLg0aodXK7H5AGlP5mCtm8JrtbJ9lNC05lhEL5wvtfYXgGZoL8ru4TpgQgqUxe
12tgX56yeRBlxACJ1Wy7nZrEpoYYvH+0bSB7fa2c921Q3f20j3XUatcppnZqcsVYi6t57TvEUY2F
JAtR3QkoWDxW1snT2lyibu6QasoFHp0UTEleZA616NhMkEjFavKHX0vLoMPeigODC6D2Ir1tEZN0
y8Lor9To
--0000000000006afb79062da155e7--
