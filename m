Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D01C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Nov 2021 13:22:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D283F61B5F
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Nov 2021 13:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhKONZA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Nov 2021 08:25:00 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24973 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbhKONXi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Nov 2021 08:23:38 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211115132038euoutp01f4b892bf412a474946727f8138d2f294~3utri8GcK2275122751euoutp01Q;
        Mon, 15 Nov 2021 13:20:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211115132038euoutp01f4b892bf412a474946727f8138d2f294~3utri8GcK2275122751euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636982438;
        bh=5bYxPZo78Voc7zE4pNqWP9ADaqbtUwoEU5ENS9AJ4Q8=;
        h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
        b=X4gtPeDNs2P/p31NcPPMSMklNuNVjEva2uh8kf0F45zSjH3FTkY441rxdQgfPwK0f
         5dtjmSCcJM0UR6yJ+qufAZ2LMeLQpZLKt0KE7tVbE8a5yEDA0BjlsX4yaX3qHHBfgZ
         8ilLu628fBAicj2ojTLzz0QlJcpKw0qwNmehLWLI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211115132038eucas1p2b6b46e90165625002a34ce645c6e6a53~3utrYpiZo3066630666eucas1p2H;
        Mon, 15 Nov 2021 13:20:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 60.74.09887.6AE52916; Mon, 15
        Nov 2021 13:20:38 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211115132037eucas1p1ff59893ece466fbc5123513d355cb361~3utqnLoXm0269202692eucas1p1K;
        Mon, 15 Nov 2021 13:20:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211115132037eusmtrp1919677610b163d6c161abf63f0db5632~3utqmlKYT3228132281eusmtrp1x;
        Mon, 15 Nov 2021 13:20:37 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-cc-61925ea6cbfb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 69.25.09522.5AE52916; Mon, 15
        Nov 2021 13:20:37 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211115132037eusmtip2a2fd245a5b1c86b7ea4daacc542b4fe9~3utqbZC4H1643816438eusmtip2q;
        Mon, 15 Nov 2021 13:20:37 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: ax88796c: ASIX AX88796C SPI Ethernet Adapter
 Driver
In-Reply-To: <20211111133508.GA22045@kili> (Dan Carpenter's message of "Thu,
 11 Nov 2021 16:35:08 +0300")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date:   Mon, 15 Nov 2021 14:20:28 +0100
Message-ID: <dleftj7dd9imhv.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduzned1lcZMSDSa0Slm8/jedxWLrLWkH
        Jo+PT2+xeHzeJBfAFMVlk5Kak1mWWqRvl8CVseJVH3PBb8GKZVMOsjUwLuHrYuTkkBAwkWi+
        8pO5i5GLQ0hgBaPEqpZFrBDOF0aJbxfuskE4nxkl7kz5xAjTcvncLKiW5YwS65sWMEE4zxkl
        XuzrAOrn4GAT0JNYuzYCpEFEQEficucPdhCbWUBZYtHtI2CDhAVCJJas/MQKYnMKZEtM/76E
        BcQWFbCU+PPsI1g9i4CqxOm29WA1vALmEqvuPGeBsAUlTs58wgIxM1di5vk3jCA3SAhs4ZBo
        v/GeCeQGCQEXiccTYiGOFpZ4dXwLO4QtI3F6cg8LREm9xORJZhCtPYwS2+b8YIGosZa4c+4X
        G4TtKNH0dgE7RD2fxI23ghBr+SQmbZvODBHmlehoE4KoVpFY178HaoqURO+rFdBg85B4tvc7
        mC0kUCuxfMIM5gmMCrOQPDMLyTOzgKYyC2hKrN+lDxHWlli28DUzhG0rsW7de5YFjKyrGMVT
        S4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAtPI6X/Hv+xgXP7qo94hRiYOxkOMKkDNjzasvsAo
        xZKXn5eqJMLLEj0pUYg3JbGyKrUoP76oNCe1+BCjNAeLkjivyJ+GRCGB9MSS1OzU1ILUIpgs
        EwenVANT+No953dPstIp+Xl9k9W7/Rz/C8q+Pqh9bBzeppiiaSm44/K8RVJyiwpEvoesi5sS
        w/nTdf/mF173jSsXeX78s/jepE2//k7niGhZ6qFwxUPXTkVz5pq5GfIHH2ox+jmta/7/gv3n
        v5wQUbk9/3bG3H+5cQrDFHHnAwZnZO9PT1+3Pm3um85Y+VfTs0LqAzurnFpe9x0PVT96zfTO
        KoXW1vCfm+1V4ic9jL919B1v7FuHl/KP53JN1VE98G1K0GIRXZb6zL6b/N4PtaTXn99yKtvx
        /akf7CpeW6/4PP3z497GvtMTg5QibTXrkvazLisJyXLOTam7xS1e262vvZDv67UUO8bvot1H
        TrvyTm96qsRSnJFoqMVcVJwIAMI2oFueAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeLIzCtJLcpLzFFi42I5/e/4Pd2lcZMSDV48MrN4/W86i8XWW9IO
        TB4fn95i8fi8SS6AKUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1
        J7MstUjfLkEvY8WrPuaC34IVy6YcZGtgXMLXxcjJISFgInH53CzmLkYuDiGBpYwSp74+Ze9i
        5ABKSEmsnJsOUSMs8edaFxtEzVNGic+HDjCB1LAJ6EmsXRsBUiMioCNxufMHO4jNLKAssej2
        EUYQW1ggRGLJyk+sIDanQLbE948gcQ6gOZoSP/tUQcKiApYSf559BGtlEVCVON22HqycV8Bc
        YtWd5ywQtqDEyZlPWCDGZ0t8Xf2ceQKjwCwkqVlIUrOANjADbVi/Sx8irC2xbOFrZgjbVmLd
        uvcsCxhZVzGKpJYW56bnFhvqFSfmFpfmpesl5+duYgTGwLZjPzfvYJz36qPeIUYmDsZDjCpA
        nY82rL7AKMWSl5+XqiTCyxI9KVGINyWxsiq1KD++qDQntfgQoynQCxOZpUST84HRmVcSb2hm
        YGpoYmZpYGppZqwkzutZ0JEoJJCeWJKanZpakFoE08fEwSnVwBTmbbJmb87t7V35++X2i8Y7
        8BhwqvA5us2Y8fGU/0aRVCPGaoe6C18dKp1mXFI6U/P1Q2T9IYMlJY/L7O/aZRyXk1K8P+2M
        4sfH+x7Ibpmcm+Pc9PWz8I5e9cxI1xKTeSGy0luNlK1Km+a9luj98mKXjfmekxOu/w0Kd41b
        5cxy7nrnucc6Qbc8BD50vdx+V8pwsnLg7rjJEZMrs0oM7VVcMx1Z6owezovZsMqkNeHw/8/i
        YYeveN8s4uHknV1yac1dq4l/GZ/l619NbvCRCvt4+8fDsLAZnNLh/2+6n1Q7P0NAwd97+zwl
        1/PZS4TE9ijX3mI/+LpqgtGVSWmXt04ULH9bKtw9uyInZonhXSWW4oxEQy3mouJEACiGlNwW
        AwAA
X-CMS-MailID: 20211115132037eucas1p1ff59893ece466fbc5123513d355cb361
X-Msg-Generator: CA
X-RootMTR: 20211115132037eucas1p1ff59893ece466fbc5123513d355cb361
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211115132037eucas1p1ff59893ece466fbc5123513d355cb361
References: <20211111133508.GA22045@kili>
        <CGME20211115132037eucas1p1ff59893ece466fbc5123513d355cb361@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-11-11 czw 16:35>, when Dan Carpenter wrote:
> Hello =C5=81ukasz Stelmach,
>
> The patch a97c69ba4f30: "net: ax88796c: ASIX AX88796C SPI Ethernet
> Adapter Driver" from Oct 20, 2021, leads to the following Smatch
> static checker warning:
>
> 	drivers/net/ethernet/asix/ax88796c_main.c:926 ax88796c_set_features()
> 	warn: duplicate check 'changed & ((1 << (40)) | (1 << (3)))' (previous o=
n line 921)
>
> drivers/net/ethernet/asix/ax88796c_main.c
>     915 static int
>     916 ax88796c_set_features(struct net_device *ndev, netdev_features_t =
features)
>     917 {
>     918         struct ax88796c_device *ax_local =3D to_ax88796c_device(n=
dev);
>     919         netdev_features_t changed =3D features ^ ndev->features;
>     920=20
>     921         if (!(changed & (NETIF_F_RXCSUM | NETIF_F_HW_CSUM)))
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>     922                 return 0;
>     923=20
>     924         ndev->features =3D features;
>     925=20
> --> 926         if (changed & (NETIF_F_RXCSUM | NETIF_F_HW_CSUM))
>
> We know this condition is true.  Was something else intended?
>

To have a readable template to add more ifs below with other features.
In such case the if at line 921 would check for all supported
features and this and following ifs would act upon different flags.

>     927                 ax88796c_set_csums(ax_local);
>     928=20
>     929         return 0;
>     930 }
>
> regards,
> dan carpenter
>
>

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmGSXpwACgkQsK4enJil
gBCJLgf+OaSS90H5euNWAuXXgG24/y2FBW+970Jb5CjOUiPVd+VPtMc5YlCnEQf2
oSj3PbQ1HcOsOywzet1edyuEeLiMd9GeYHN+zulFETywtBMgFqUqFexzxaJ8intK
WGOtdAOXoFg7Azkj1hBIjlagS0xGaQcFuzVM1leH1OKljVT63Oc07VGaWnqVRHrD
0oZsz7mK+lMPzG8du/3LsR2ua6r0Eyj+dby79lmqPodPEKAUeT95gcXgTdKmva35
TNx+m43H1EtFuk3cahkL4j8dfNwXdcEZ4pcqvdYyXT83lqXclIMXepyXMuZjBV6U
shCSJqi7SPDfG714k7HHAOKqN6+JEQ==
=KufR
-----END PGP SIGNATURE-----
--=-=-=--
