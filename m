Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94924154439
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Jun 2024 07:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717743924; cv=none; b=t8dX2hRPNDxOYZ3qaHUoU1y5qc/XSB8thCtR2ucmpHLsOpZnLmpmrREBcf/lp/YtjttIaSZx11iQJ4wUbDkh+6q32ALu4qalzduP0O07wJyAAUceXy1mbAQukPNuFwWuT8CEekHFnyfw2YC7iRW51LRiTPsCK0qPWEUnyK7fCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717743924; c=relaxed/simple;
	bh=nCKjOvPtkI6Jxu47OESopixHSlbmRxzoAX44ldJx3fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RabsYzA6c4OgsSPmmz/xAcIj7A+/cbS3F7mSYzrw4oAUdqQuUidCPQ0HJzgnsjTdmP3zElvHyQvLkdZB8Ybavp6bDBHzFvU+SC1qwO78o21bfT63+1qeLHNzV6niZ4Gm+eXo+MeN6g7v8bY5hXn+OfMUcdhF6LoI8h/9eEfMJeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p4mWD1B+; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p4mWD1B+"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4400cc0dad1so241311cf.0
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jun 2024 00:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717743921; x=1718348721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nCKjOvPtkI6Jxu47OESopixHSlbmRxzoAX44ldJx3fM=;
        b=p4mWD1B+h4U6PTAGthYJhMAfkuvngUzT41trsUcwdH3NOTn3KvDgYqNG9TQ+n4gqvE
         8Arne2Mp9BlULiDc+rKn82ve2eQ4cCAKoA5VH/5Ce1QXn/K1WBpYeTM9X40fdGbgi3C3
         pWP/MafcrwforICJSP4MnAdsgDdUBhLiqu0uv/brUXVDgEBQN/O5rLjrpYbf1vr4luAn
         Z0gUvzA8Qqsa9sgZ40Ocmdkn6V8RBr/zC3cSTuPX4y0UuAKbj+ZRQOs7ogGpGyAdLqIM
         H7X4OzP+25f5Rfev5ssNu8NLXNbkuv0W2dMPJW38s1PKTiGjpmIicOsEHHz1yCnEDqaZ
         c33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717743921; x=1718348721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCKjOvPtkI6Jxu47OESopixHSlbmRxzoAX44ldJx3fM=;
        b=vso60hPUWybwS/qeyUa2zQ9jRzNBLZczAdWxvBWY0G9UtoMARxNMjiPM05bE1ihIuW
         GfA9qtuZQQQH4/20DUZxshZJ8WPonayC5NITQm4ggKS/IDoPWu7UOggdJ/uXzWL+ZJnF
         8zDp2jY1Zkuo4JTEuf6IDWZ1MTmfc6Xh1r54dMN+JoPH4D/WpvM59uQqdVSDsySgqBGv
         BcI+BD8G4yDCfm+vw+ITYnBzYNXgSdvfcpvLT9I5pGNczrTh7akZUcx0HE+yagRxSWAe
         xf2EplSl3Q1vGB+HtTtjKTawxDhxbj13XfxDM33LDaeZJ/lcDdHLYXFaa9DVhQMM+LpW
         aWJg==
X-Forwarded-Encrypted: i=1; AJvYcCW/zLPOSvFBILe+Pm9gvWaBMSKRd3q8UPOiqItXCwCbA+wJx7LFU6bZ5U9VHCN7bZ1gV8faF5bLNri0YxVPzgNlS3W3wJvyHJ1RkJVVT98I
X-Gm-Message-State: AOJu0YwlUYrj+Efratr5SQ9qBRLVy0KDakuUws5L1cj8M7J2A/QsK+q9
	x7JPyoeGZ7KLMt7Ru/RdYHii+Fon9OWpODy9jB9ubMhPjHNsmhAgMMtrkw/PCtjUf5Kj+rS9Dm+
	cwz+yGLPiXibQCGVt67mAW3507Dk8kSyy+QIZ
X-Google-Smtp-Source: AGHT+IH/R+cvtIHI1kAkTmVSndk1xsEvhq1ET9so2r01OzVDjHUY5mMlZ+sqfn6VluAvEL8ZVwjIKDx2tres9GCPCUQ=
X-Received: by 2002:ac8:700e:0:b0:440:44e9:27b7 with SMTP id
 d75a77b69052e-44044e92aafmr921121cf.4.1717743921394; Fri, 07 Jun 2024
 00:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240601-md-lib-kunit-framework-v1-1-f406bb629bde@quicinc.com>
In-Reply-To: <20240601-md-lib-kunit-framework-v1-1-f406bb629bde@quicinc.com>
From: David Gow <davidgow@google.com>
Date: Fri, 7 Jun 2024 15:05:10 +0800
Message-ID: <CABVgOS=bpff0aejxAWr=y=k-gOkq4QYw614svbaVkXs8Md+dQQ@mail.gmail.com>
Subject: Re: [PATCH] kunit: add missing MODULE_DESCRIPTION() macros to core modules
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004691e8061a476c5d"

--0000000000004691e8061a476c5d
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Jun 2024 at 01:19, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> make allmodconfig && make W=1 C=1 reports in lib/kunit:
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-example-test.o
>
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

--0000000000004691e8061a476c5d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
LmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEANyYcO+9JZYyqQt41
TMwvFWAw3vLoLOQIfIn48/yea/ekOcParTb0mbhsvVSZ6sGn+txYAZb33wIb1f4wK4xQ7+RUYBfI
TuTPL7olF9hDpojC2F6Eu8nuEf1XD9qNI8zFd4kfjg4rb+AME0L81WaCL/WhP2kDCnRU4jm6TryB
CHhZqtxkIvXGPGHjwJJazJBnX5NayIce4fGuUEJ7HkuCthVZ3Rws0UyHSAXesT/0tXATND4mNr1X
El6adiSQy619ybVERnRi5aDe1PTwE+qNiotEEaeujz1a/+yYaaTY+k+qJcVxi7tbyQ0hi0UB3myM
A/z2HmGEwO8hx7hDjKmKbDCCA18wggJHoAMCAQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUA
MEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWdu
MRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEg
MB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzAR
BgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4
Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0EXyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuu
l9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+JJ5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJ
pij2aTv2y8gokeWdimFXN6x0FNx04Druci8unPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh
6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTvriBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti
+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEA
S0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigHM8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9u
bG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmUY/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaM
ld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88
q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcya5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/f
hO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/XzCCBOMwggPLoAMCAQICEAFsPHWl8lqMEwx3lAnp
ufYwDQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjMgU01JTUUgQ0EgMjAyMDAeFw0yNDA1MDIx
NjM4MDFaFw0yNDEwMjkxNjM4MDFaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCTXdIWMQF7nbbIaTKZYFFHPZMXJQ+E
UPQgWZ3nEBBk6iSB8aSPiMSq7EAFTQAaoNLZJ8JaIwthCo8I9CKIlhJBTkOZP5uZHraqCDWArgBu
hkcnmzIClwKn7WKRE93IX7Y2S2L8/zs7VKX4KiiFMj24sZ+8PkN81zaSPcxzjWm9VavFSeMzZ8oA
BCXfAl7p6TBuxYDS1gTpiU/0WFmWWAyhEIF3xXcjLSbem0317PyiGmHck1IVTz+lQNTO/fdM5IHR
zrtRFI2hj4BxDQtViyXYHGTn3VsLP3mVeYwqn5IuIXRSLUBL5lm2+6h5/S/Wt99gwQOw+mk0d9bC
weJCltovAgMBAAGjggHfMIIB2zAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1Ud
DwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFDNpU2Nt
JEfDtvHU6wy3MSBE3/TrMFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AGwXYwvLVjByVooZ+uKzQVW2nnClCIizd0jfARuMRTPNAWI2uOBSKoR0T6XWsGsVvX1vBF0FA+a9
DQOd8GYqzEaKOiHDIjq/o455YXkiKhPpxDSIM+7st/OZnlkRbgAyq4rAhAjbZlceKp+1vj0wIvCa
4evQZvJNnJvTb4Vcnqf4Xg2Pl57hSUAgejWvIGAxfiAKG8Zk09I9DNd84hucIS2UIgoRGGWw3eIg
GQs0EfiilyTgsH8iMOPqUJ1h4oX9z1FpaiJzfxcvcGG46SCieSFP0USs9aMl7GeERue37kBf14Pd
kOYIfx09Pcv/N6lHV6kXlzG0xeUuV3RxtLtszQgxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAFsPHWl8lqMEwx3lAnpufYwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIGmKy0FaBQCTp2tGEOrAT4IlaVtXvDGdxJVVGtHUxviIMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDYwNzA3MDUyMVowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBXLmx8
lspNlDzkG3oPI6IOhun0mKkfImYY5mknRH0TgWF1jtQHyCOFiw+OkhpnamzbxTQPlT+aRKL33jWK
+eRs1tXwgqyxpJn4bWoK7or/zWPxB8U2YuOx+jv4cTB/vDRWIJ1AJKlmfvOjsYKxiLvTYCxcwnZ5
yuOXwJqwWIBGnkimA5nUyOmLJur5l7xUNcA6LOD06HNiVzJtbUIHYnzJeYRxo3QBtnb9b94GaRMD
uawWDuprn8F8YWiqtNWTM4ACWYfXKfMJlgWzu3W8pVxVUSQ/BNqjdMvBAOnTaJsSU78SMToobIba
uU8OVDq15e2ur8uz/Tmv8hShnl7J9ni4
--0000000000004691e8061a476c5d--
