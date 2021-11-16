Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FF5C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 00:47:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0F6061A09
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Nov 2021 00:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344520AbhKPAuL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Nov 2021 19:50:11 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49650 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357290AbhKPAqi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Nov 2021 19:46:38 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211116004340euoutp020ec2a8d2e7468d955af45685720cb5d3~34CC0gdsA2774427744euoutp02Y;
        Tue, 16 Nov 2021 00:43:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211116004340euoutp020ec2a8d2e7468d955af45685720cb5d3~34CC0gdsA2774427744euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637023420;
        bh=tV6lTCkc9xCBGV2iEJSnbSAuriHtArlsqSHlbj9E8F8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ETYnEfcB1HV8starCVraPnxBKBTe7fyJRmVSlcZTMl6FgyNIn8mQMWNMmnbCd1oH3
         xdk+bXs4VZJqs7TXM3wVVn2wx8+n2d2fbFrC3ltm0T6sr5NlM9OzPNjRSlHkN/eb6y
         lPG+VNOGRLz0VYQRf0E+e5GZ8kxR+5pSBxZFNJk4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211116004340eucas1p2a7d018bbbacd991ad182fb76dc4adfd0~34CCnlNpV1668316683eucas1p2L;
        Tue, 16 Nov 2021 00:43:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 61.4F.09887.BBEF2916; Tue, 16
        Nov 2021 00:43:40 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211116004339eucas1p14e377393256e09c0e04e3da92ad0accb~34CCAm-Wd3240732407eucas1p1U;
        Tue, 16 Nov 2021 00:43:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211116004339eusmtrp199147209472a7b40ead911c5b0ce8095~34CCABtmp2942329423eusmtrp1a;
        Tue, 16 Nov 2021 00:43:39 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-a6-6192febb731e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A4.0B.09522.BBEF2916; Tue, 16
        Nov 2021 00:43:39 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211116004339eusmtip2dc7bb1d9f7a470358651eb5a55a7d1cb~34CBw-j-J2860528605eusmtip2O;
        Tue, 16 Nov 2021 00:43:39 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: ax88796c: ASIX AX88796C SPI Ethernet Adapter
 Driver
Date:   Tue, 16 Nov 2021 01:43:24 +0100
In-Reply-To: <20211112123648.GA21129@kili> (Dan Carpenter's message of "Fri,
 12 Nov 2021 15:36:48 +0300")
Message-ID: <dleftj35nxhqvn.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfyzUcRjH97n7nvsyp28XeaJfE1PKXTVCaEwr1TRr/bbUd/qEOUd3KGKu
        zZpE6SgilkMquSRdrblsV51xXb/Jz9YiN6fmd2G65Xyvrf9ez/O83+/n+Wwfks3P4TiRseIk
        LBHTIhcrG0KlnXnr2WSS0xurO5HvsKmI8H3c7RzECh373k2ETjSsDGcdtQk4iUWxKVgi3HbC
        Jkb5u4ybWMs/a9SmydCMXQ6yJoHygv6xF5wcZEPyqTsI+u6/ZDHFJALtawXBFBMIrvZ2sP9Z
        ygemEDOoQXBtfMRSGBBMTxnmw0jSihJAXd1hs8Ge2gAfL05zzcym1oCi5yUy8xJqP1TdHV+Q
        E5QbaB4eMbetqTgo1RezzMyjfKBjuJBjZgfKD+YGx7hMfzG03hggmMh4uPH2x8IJQD0loXmw
        1nLodpjQT3EZXgLGlkYLLwddQS5h3gtUJhTItzDeXASqm9MEo/GH3jezVgwHQ8e1Sjajt4PO
        n4uZvXYgVxVZ2jzIvsBn1K6gvNJkSXGCPOMdxHAoNJ6vW0jkUxkw06cg8tHqkv9eU/Lfa0rm
        U9nUOnjwTMi018PtimE2w4GgVI4QtxDnHnLEydL4aCzdLMZnBFI6XposjhZEJcQ3oPkvojO1
        TD5FNcYxgQaxSKRBrvPmb/W175ATIU4QYxd7HhEhp/m8k3RqGpYkHJcki7BUg5xJwsWRZz8n
        o/lUNJ2E4zBOxJJ/UxZp7SRjVe+K+uP5pKsPt1+uEo5WW33Obes5WN94AFqfRzx67503JKqy
        fae+n4GHPBfJhz6U+vHyltrinf0huiTNpeRX51z93bOLu0Y5k2nHTg14n84zeGt9c+tCQtaq
        2YPlcZLUgPCGMlDLu2O8KoMjD0U0RfWVZ/EutN9O8A+LuJ4l+PrleY+9w+GO/M0bv3zt/JiY
        cjQ1rJLb2r9bviy9KKT3cvEcy3Hv7HbnVc6FuubStulAf9tLe9Jx2dW2kpyiFbZ7j+/Q9Idy
        Z8MKa0Vqn/0B7ZHCX0GfsrjWwbHuBpMpQLE1c19KWr2H4YWia6jCK0zvoan/JJa1pNfQ+qX5
        IlWzmwshjaE3ebAlUvovJgDvI50DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpikeLIzCtJLcpLzFFi42I5/e/4Pd3d/yYlGhxdKGLx+t90Foutt6Qd
        mDw+Pr3F4vF5k1wAU5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpq
        TmZZapG+XYJexrrvc9kLVgtVvDpW1cD4k6+LkZNDQsBEYt6Tr4xdjFwcQgJLGSV+/lgP5HAA
        JaQkVs5Nh6gRlvhzrYsNouYpo8SZFXvYQWrYBPQk1q6NAKkREdCRuNz5gx3EZhZQllh0+wgj
        iC0sECKxZOUnVhBbSEBT4sLRdjaQVhYBVYlDGyNBwpwC2RKrJncwg9i8AuYS115PASsXFbCU
        +PPsIztEXFDi5MwnLBDjsyW+rn7OPIFRYBaS1CwkqVlAG5iBtq3fpQ8R1pZYtvA1M4RtK7Fu
        3XuWBYysqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQIjYNuxn5t3MM579VHvECMTB+MhRhWg
        zkcbVl9glGLJy89LVRLhZYmelCjEm5JYWZValB9fVJqTWnyI0RTos4nMUqLJ+cDYzCuJNzQz
        MDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYGJeZ/7YsW+yquUEK6Hg4Gc6
        l1WDw+b+M3B723ArhZ+tbZ+GuuVRozqbxRezL7M6+J8/dWF53/LXO+yuRh+cufRh+J/Zy+uv
        TBXgfFNh+vZMrFz5wenshROcxC3djIKtFf+cmcWyQ6VqHeMEtsgvyz5p/HxwKTzt5ATtXbu1
        bu+Y1uqa9P6o6tOz/oxuAs1sq6LeWfcltR9Zf69M71Ty7tz7BVzf/+5K/pu998rD+tlVQlNN
        N3/zrPdlcEldoZJ+OfbK92kFD9V2nLt9znDhkb0TJXgNYl9Omdqz8ACH5jKd9dqy7krJ8+sv
        T/lY89b7kh73JbW5oq823jp/eVGZYNeB5flzn7ycUH7Vk6PGJ+6mEktxRqKhFnNRcSIAbL4H
        gRUDAAA=
X-CMS-MailID: 20211116004339eucas1p14e377393256e09c0e04e3da92ad0accb
X-Msg-Generator: CA
X-RootMTR: 20211116004339eucas1p14e377393256e09c0e04e3da92ad0accb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211116004339eucas1p14e377393256e09c0e04e3da92ad0accb
References: <20211112123648.GA21129@kili>
        <CGME20211116004339eucas1p14e377393256e09c0e04e3da92ad0accb@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-11-12 pi=C4=85 15:36>, when Dan Carpenter wrote:
> Hello =C5=81ukasz Stelmach,
>
> The patch a97c69ba4f30: "net: ax88796c: ASIX AX88796C SPI Ethernet
> Adapter Driver" from Oct 20, 2021, leads to the following Smatch
> static checker warning:
>
> 	drivers/net/ethernet/asix/ax88796c_main.c:391 ax88796c_start_xmit()
> 	warn: test_bit() takes a bit number
>
> drivers/net/ethernet/asix/ax88796c_main.c
>     382 static int
>     383 ax88796c_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>     384 {
>     385         struct ax88796c_device *ax_local =3D to_ax88796c_device(n=
dev);
>     386=20
>     387         skb_queue_tail(&ax_local->tx_wait_q, skb);
>     388         if (skb_queue_len(&ax_local->tx_wait_q) > TX_QUEUE_HIGH_W=
ATER)
>     389                 netif_stop_queue(ndev);
>     390=20
> --> 391         set_bit(EVENT_TX, &ax_local->flags);
>
> EVENT_TX is BIT(1) so this ends up being a double BIT(BIT(1));.  Which
> is fine because it seems to be done consistently.  But probably it
> should be:
>
> #define EVENT_INTR		0
> #define EVENT_TX		1
> #define EVENT_SET_MULTI		2
>

Apparently this is a porting artifact. Originally these were defined as
{1,2,4}[1] so I changed that to BIT(x) without much
consideration. I am fixing it. Thanks for reporting.


>     392         schedule_work(&ax_local->ax_work);
>     393=20
>     394         return NETDEV_TX_OK;
>     395 }
>
> regards,
> dan carpenter
>
>

[1] https://lore.kernel.org/lkml/20200825170311.24886-1-l.stelmach@samsung.=
com/
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmGS/qwACgkQsK4enJil
gBAwlQf+NKmrYd0rPljNLpmUCGferW7iP2aiwgDNpbW+qg9HaOmFqNWGRsfJHS+o
JnDzZSfovyKxAvEHKKGhz0y/ri84YJo0q0B7TjAnSUE9iTM1JNqlXK+QsZBs8nki
CZy6ESk1DfRHF+5cLw0A6coAA4GSn21945wo6DUg0bVvRzmAZmZVDKaCxPdsYZFJ
QtOBCq9kfQlpORx+DA0QzwFyhbNUD3UZgdsu6mgTNQ3X3vQUMaCuXBStArrwS13n
rY3DdOMtka7leVq4zaNTA59435Nf5ThT8z7p0bFVbdgnpBI2zchLKBit/8qm2lFe
5dPH87M+fOExeO87AKibv+OBdioWjQ==
=CNWv
-----END PGP SIGNATURE-----
--=-=-=--
