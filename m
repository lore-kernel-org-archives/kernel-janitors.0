Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44C2262FE7
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Nov 2025 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176360; cv=none; b=SWgv+WnwP112O+lqIhm1Rqe4clQiJ9R0ly3v3yT7zXjxoFwM6UAiW5smoDJMAB4bQgFpfKPRA4AkF9mMS5K5fkYgtDy+BDNqpEf3JpibuZz8VMA4Zmzvs1YDY4EGtl/QeUKwlmohduGFBfNmL1YRNg2I0hRRzUrQBO6l7TQWZ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176360; c=relaxed/simple;
	bh=kgp5Yvte42p4gbCZLk/wI7Qek18+z6EgzMxotV8dtCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTeQtKACTrOvlXHMbbRS5Z2zCtORC2bMc6FzbtEIi7HO2fwGPVLvXfKiV75VXFyrZnMPX6fBfgH2kp3PvuRHDxLvMA6jjS6lCBMiUDYSU9GbCtr4iDjuhl4YzyzPyQY4U/NW7HOlAWu5y14CMZVqvL3YD7FIZZhf6wioeBVmRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K4Im5Epj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K4Im5Epj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b70406feed3so959124966b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Nov 2025 05:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762176356; x=1762781156; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kgp5Yvte42p4gbCZLk/wI7Qek18+z6EgzMxotV8dtCw=;
        b=K4Im5EpjZAwqAdKqBoLyv/lFCgr5JQAtN/uxl+UItDTlZOaaymUIBmmK5euoqcij7+
         85TCsuBsUR5YuWFPJ7A2WWY3dAIE1tXuiwE9kU8v2L82tjU9FIT+aOmG9W0rNkBz0E83
         kchm+y/XtiEh583n4zk9gpOtTgl6bAvpVC/I2ZhIaH4DgXJ7LhXHWsDhz93TFhpmkmT+
         6cngpFVx2bjXB1jD9NqMLh41d7K8Y/OYgAWjcM5+acHDrEcnsAlrFjPFYmsQf0XKSHzh
         QxMuQXxVmODnI0AIsfDPkbsc8k2xc9T586DZd3E8xQRuexVMFBQcOunQPa6rjp0hpyq7
         so/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176356; x=1762781156;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgp5Yvte42p4gbCZLk/wI7Qek18+z6EgzMxotV8dtCw=;
        b=hS6S1wi0GF8Jc56Hw6HZ/V3KD2Fdfuuy28gcbMsw1aAjn16+Z+NsdhOwN4yi0EsVB1
         dNCfzc5S1MGbL7wfiG1zxhDdpBREFhz1H3uNzG+5L1BSEMj7aHu6bhdSXyUXf3/C//kb
         U0Y5XpHuWSBn28M16+84Hg5fZ1AhyeoUYD/0GKgbSYmQDX0jBvV5zGZzyGSMhfiggLSc
         oXMgxrmhOq8XxzCk3In1XIQRsN47xRsWlHmye4Gcz27jDtaTHb5EH8N1nTJNMDIVTXv3
         H5wxMwQKv57rSVecIdv8bnwWPY/9EckdX3g3COIhgrDwqi1P1PytN2JAgvYsBnlHbJtR
         e2jA==
X-Forwarded-Encrypted: i=1; AJvYcCWQAUL+aNySzaN5pbiYydB2tvg+sLdDTHw4wJlucpQTtnZ+0LMqZC1vDD8qo+ouR0cmnaCDJrERKqabQiBB4PU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxywqmsNA44xtmmHoQz6iJJwcpTqk6xZ1jLCDnv7FXRIwt8UtYZ
	YC3zL/LQ2587hKObCazMhzYmfgV8r0qA5SwY89fXAaFfIZtPq3GbmZaHCxWMPKyCfN0=
X-Gm-Gg: ASbGncvSr+ATHrwy5IGxZcnrYOeV5T9KugcawwLSIpPxdVNOboAyBPDMD5R57CyMNca
	oIGv3MseJ8kbGCKsdIIh4veFngRa0i0jfJgqi+hBAZxYi6bnK0nyASG7RZ7tLWzzmVsxDNw1w96
	GUDIaTs/iGhbY7nLXxx1PuBG53m8xBu/cLyNOtxCOeBZSKQSHinIz4c2mOmgRiQ+JggCpCYGOyI
	NP8nZEeAq3dQetlYbtkla4l4BaGC2VyNq1B659WMdNKat8YEygwRIVBMSMCRO+8So12VtNjiwrc
	vDKtaSyLsxqPplUCeYagc2mt/eWGcj6YKgNNC7NHbdwgc1n39mqhSC1c+7MldmqnGFvwFxLlsu+
	s5iZj2ASEekety7qGvXpxW5VfjCj33Wuhs9IApsfxR1+48w/dIxHRRd/79ag9kU/DllUf7FLr6q
	Ame1yz1TDviQrBSpQyjazfjUupPgD45MFIjUt2Yt4gKcw4hKooFSHGYGqCWLEEyvr/CUV6mfvTj
	kqq4c6n5FmPZEeExn49opSYbguj
X-Google-Smtp-Source: AGHT+IFAHmrTO8ln01Qomtjqa892AilurAv+0OR4p/HILoaEUB1Hxz++lDSIBJgfYm97zdNyDKQMnw==
X-Received: by 2002:a17:907:26c9:b0:b71:ea7c:e509 with SMTP id a640c23a62f3a-b71ea8c3121mr13414166b.41.1762176356222;
        Mon, 03 Nov 2025 05:25:56 -0800 (PST)
Received: from ?IPV6:2003:e5:870e:1500:7795:3e8a:56c1:ae53? (p200300e5870e150077953e8a56c1ae53.dip0.t-ipconnect.de. [2003:e5:870e:1500:7795:3e8a:56c1:ae53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70bd65cc72sm347503766b.19.2025.11.03.05.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 05:25:55 -0800 (PST)
Message-ID: <1d4245fb-c48f-4e0a-8c69-c18f23b0fd5a@suse.com>
Date: Mon, 3 Nov 2025 14:25:55 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/usb: Constify struct hc_driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org
References: <63241c9e857646d895ce615b998d41ee4829f9e3.1761475831.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <63241c9e857646d895ce615b998d41ee4829f9e3.1761475831.git.christophe.jaillet@wanadoo.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TEFMu9nrGOax3HN0PtapF02y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TEFMu9nrGOax3HN0PtapF02y
Content-Type: multipart/mixed; boundary="------------U1zNNy0zDczPsawwTlYAN2iq";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org
Message-ID: <1d4245fb-c48f-4e0a-8c69-c18f23b0fd5a@suse.com>
Subject: Re: [PATCH] xen/usb: Constify struct hc_driver
References: <63241c9e857646d895ce615b998d41ee4829f9e3.1761475831.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <63241c9e857646d895ce615b998d41ee4829f9e3.1761475831.git.christophe.jaillet@wanadoo.fr>

--------------U1zNNy0zDczPsawwTlYAN2iq
Content-Type: multipart/mixed; boundary="------------igYf0v5aAHmtcgkvWfha5CqD"

--------------igYf0v5aAHmtcgkvWfha5CqD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMTAuMjUgMTE6NTEsIENocmlzdG9waGUgSkFJTExFVCB3cm90ZToNCj4gJ3N0cnVj
dCBoY19kcml2ZXInIGlzIG5vdCBtb2RpZmllZCBpbiB0aGlzIGRyaXZlci4NCj4gDQo+IENv
bnN0aWZ5aW5nIHRoaXMgc3RydWN0dXJlIG1vdmVzIHNvbWUgZGF0YSB0byBhIHJlYWQtb25s
eSBzZWN0aW9uLCBzbw0KPiBpbmNyZWFzZXMgb3ZlcmFsbCBzZWN1cml0eSwgZXNwZWNpYWxs
eSB3aGVuIHRoZSBzdHJ1Y3R1cmUgaG9sZHMgc29tZQ0KPiBmdW5jdGlvbiBwb2ludGVycy4N
Cj4gDQo+IE9uIGEgeDg2XzY0LCB3aXRoIGFsbG1vZGNvbmZpZywgYXMgYW4gZXhhbXBsZToN
Cj4gQmVmb3JlOg0KPiA9PT09PT0NCj4gICAgIHRleHQJICAgZGF0YQkgICAgYnNzCSAgICBk
ZWMJICAgIGhleAlmaWxlbmFtZQ0KPiAgICA1MjA2NQkgIDIzMTc2CSAgICAyNTYJICA3NTQ5
NwkgIDEyNmU5CWRyaXZlcnMvdXNiL2hvc3QveGVuLWhjZC5vDQo+IA0KPiBBZnRlcjoNCj4g
PT09PT0NCj4gICAgIHRleHQJICAgZGF0YQkgICAgYnNzCSAgICBkZWMJICAgIGhleAlmaWxl
bmFtZQ0KPiAgICA1Mjg5NwkgIDIyMzQ0CSAgICAyNTYJICA3NTQ5NwkgIDEyNmU5CWRyaXZl
cnMvdXNiL2hvc3QveGVuLWhjZC5vDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPg0KDQpSZXZpZXdlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------igYf0v5aAHmtcgkvWfha5CqD
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------igYf0v5aAHmtcgkvWfha5CqD--

--------------U1zNNy0zDczPsawwTlYAN2iq--

--------------TEFMu9nrGOax3HN0PtapF02y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkIrWMFAwAAAAAACgkQsN6d1ii/Ey83
zAf/V8o9him1m5n2Cy1Eu+4EImq5rnOS7huVQzH57w39s2/UjORPn5xR/t6WanpzOnSI0ogQdHHZ
kYxY+J7ecJCcU2YgK3LUq/w3I3Utf9lZutMteCeeTv0KaP1rJnTquK4tJvTXsfVbjkbrqSSN1ooJ
X0HdP5wgOqOxs05tluo0lpL4dRrtsZHkCsviMqCYQYrxUHp9UOb37FS+FEQiKwyAxXI1zIUH71lG
ArUaKU4eJcD1/LxEu6SZEHryOSKtg132w+pEOHXPqRKarOTRmY+mSmd4bulWZOGtqDVsK9s9wnvI
+oC9Z1WnSCRooLIj+A5NgkAIdYDzUTNPSxanTWhfgA==
=WwW0
-----END PGP SIGNATURE-----

--------------TEFMu9nrGOax3HN0PtapF02y--
