Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51082C25B06
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Aug 2022 08:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiHNIhs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 14 Aug 2022 04:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiHNIhr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Aug 2022 04:37:47 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65FF1CFF8
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Aug 2022 01:37:46 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 71C6B20762;
        Sun, 14 Aug 2022 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1660466265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T2H7wKICSLAGDkgVdBuBlfHhjWQictapAMM3wbw+yG0=;
        b=K8bGc1/zhL8VmddOzRQv3jWayQBma4c03Ohl5ktvs19U2ETdYBAcw1/ylP95gr80jvdch4
        fBqKCOpjCVvOg+49g2notnJm6nxjESyed0d4f/1zTiSR9MeMVMnnNDbS/xrL4Xigdy+WPH
        9M9+b6nlDv/oZfphE5a8JIiJ+FnO5jQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FB0513AAE;
        Sun, 14 Aug 2022 08:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id XFdIBlm0+GITNwAAMHmgww
        (envelope-from <jgross@suse.com>); Sun, 14 Aug 2022 08:37:45 +0000
Message-ID: <5caf852e-0a46-783f-644d-26975dc5a06e@suse.com>
Date:   Sun, 14 Aug 2022 10:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/xenbus: fix return type in xenbus_file_read()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Bastian Blank <waldi@debian.org>
Cc:     Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Ian Campbell <ian.campbell@citrix.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
References: <YutxJUaUYRG/VLVc@kili>
From:   Juergen Gross <jgross@suse.com>
In-Reply-To: <YutxJUaUYRG/VLVc@kili>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5thXZJD0dUzCBup90WFpBGJS"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5thXZJD0dUzCBup90WFpBGJS
Content-Type: multipart/mixed; boundary="------------flmFDeBxMwLYIZKJCJvXEjI1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Bastian Blank <waldi@debian.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Campbell <ian.campbell@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Message-ID: <5caf852e-0a46-783f-644d-26975dc5a06e@suse.com>
Subject: Re: [PATCH] xen/xenbus: fix return type in xenbus_file_read()
References: <YutxJUaUYRG/VLVc@kili>
In-Reply-To: <YutxJUaUYRG/VLVc@kili>

--------------flmFDeBxMwLYIZKJCJvXEjI1
Content-Type: multipart/mixed; boundary="------------punRGa0vc0s5gAXWO71LlAxP"

--------------punRGa0vc0s5gAXWO71LlAxP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjIgMDk6MTEsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IFRoaXMgY29kZSB0
cmllcyB0byBzdG9yZSAtRUZBVUxUIGluIGFuIHVuc2lnbmVkIGludC4gIFRoZQ0KPiB4ZW5i
dXNfZmlsZV9yZWFkKCkgZnVuY3Rpb24gcmV0dXJucyB0eXBlIHNzaXplX3Qgc28gdGhlIG5l
Z2F0aXZlIHZhbHVlDQo+IGlzIHJldHVybmVkIGFzIGEgcG9zaXRpdmUgdmFsdWUgdG8gdGhl
IHVzZXIuDQo+IA0KPiBUaGlzIGNoYW5nZSBmb3JjZXMgYW5vdGhlciBjaGFuZ2UgdG8gdGhl
IG1pbigpIG1hY3JvLiAgT3JpZ2luYWxseSwgdGhlDQo+IG1pbigpIG1hY3JvIHVzZWQgInVu
c2lnbmVkIiB0eXBlIHdoaWNoIGNoZWNrcGF0Y2ggY29tcGxhaW5zIGFib3V0LiAgQWxzbw0K
PiB1bnNpZ25lZCB0eXBlIHdvdWxkIGJyZWFrIGlmICJsZW4iIHdlcmUgbm90IGNhcHBlZCBh
dCBNQVhfUldfQ09VTlQuICBVc2UNCj4gc2l6ZV90IGZvciB0aGUgbWluKCkuICAoTm8gZWZm
ZWN0IG9uIHJ1bnRpbWUgZm9yIHRoZSBtaW5fdCgpIGNoYW5nZSkuDQo+IA0KPiBGaXhlczog
MmZiMzY4M2U3YjE2ICgieGVuOiBBZGQgeGVuYnVzIGRldmljZSBkcml2ZXIiKQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQoN
ClB1c2hlZCB0byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNi4wDQoNCg0KSnVlcmdlbg0K
--------------punRGa0vc0s5gAXWO71LlAxP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------punRGa0vc0s5gAXWO71LlAxP--

--------------flmFDeBxMwLYIZKJCJvXEjI1--

--------------5thXZJD0dUzCBup90WFpBGJS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL4tFgFAwAAAAAACgkQsN6d1ii/Ey9F
iQgAmBN/4ndjK9pQ4PfbKdIFpNtrks97bdVxJVj+LgjZeUg/P58gZSFZav/Yo8vrFI1QQhU4SxCj
WRS/AwE4fS1F19vOjTuS5eGcJKmxsepJK38QmieRyXIqhvReMl8hQGHYhnFRHuLzdS9e/n2qiFoD
AApSkv7B/TNQYaHidJtYPkzNxpdVdsRgF2fwrB0mrCKOjFWJHjco8u5JyPQy1kIAUKnbOV2lmWDJ
ldu6tZpq42/t1pn6eohOq42RV1q7jvXnAkF8SL6H7Th2R9tC7a2m/vDFEBbGPxNNhaWxI/e3L2lm
X450OTV7woKiYnTNVMlqKRBOG5EZL9g1fBvFDcMPAQ==
=Vak9
-----END PGP SIGNATURE-----

--------------5thXZJD0dUzCBup90WFpBGJS--
