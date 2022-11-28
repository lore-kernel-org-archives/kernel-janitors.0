Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B19DC433FE
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Nov 2022 15:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbiK1PFe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Nov 2022 10:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiK1PFd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Nov 2022 10:05:33 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225401BEA6
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Nov 2022 07:05:32 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3a7081e3b95so108465087b3.1
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Nov 2022 07:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O+Ov20DUAtvLr77SuPn47a/mpKz1ftyMaLGVYw9Lu20=;
        b=hf/N7jbJ8eR5IIx5vRl7jNol0WKZcEOI7gI6pd+7n7OK0H6X1+MhBsk/AlI3cw2Gzw
         qrfxUnjRdAm36F6TcxXHUN2wzvzEutvE6tYsvyh+UlhfIY3dV4zeJXHsB/ppiIgVtkPM
         Hh/0E3ymuxlEtrXKIUfAdZ4wJ+6iRchw56vk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+Ov20DUAtvLr77SuPn47a/mpKz1ftyMaLGVYw9Lu20=;
        b=hDxxFTWUJew+MQyUXH6OoKGPXgfSCavk2SzBwJUX/FCSfPe+r3QvNbmnaWECbvgJoa
         b54juVlPODFbLdeolnoQrgJDTEXUiJzBv0YDHXtlk/fCNRYfjSldgAtN9avyNruK0TrQ
         DMZFbhaOmRArQFn2bgX5joljdGKuwzZM6MgdUM6xkn1HBsN/H/FfgVqukeHCeEtDnSbf
         G3M3UcUnIFENsc4oQV4y3Ysy5oD7w7NKYjs5ODbR4inLHFhgY8DpSePlFVrKLBPl0/ZY
         +EbB8oOg7gSaeR1EL88/CggZ4xdYLyLxNNX0LIHSDPgy9YVchN8UfmarTk58acW5bCPr
         mKeA==
X-Gm-Message-State: ANoB5pmE+21Y9N6vY8ASUo4cCq2bZMwF2O5ZXPkLReM7m4+oGfU2lNU8
        eCI6GIbl8xvNMDZQeqxuzwlBQTL/WI1jZrLoA7dF1Q==
X-Google-Smtp-Source: AA0mqf7REO/gM8RSsTDUXoXw26ul7cg8OtactsAYOBJoG7aCrvURcd4dbif3cOVgO8H4nRr6+koysUlWjZERrurcfKY=
X-Received: by 2002:a81:1781:0:b0:3cc:919:6196 with SMTP id
 123-20020a811781000000b003cc09196196mr2114216ywx.154.1669647931113; Mon, 28
 Nov 2022 07:05:31 -0800 (PST)
MIME-Version: 1.0
References: <Y4SWJlh3ohJ6EPTL@kili> <CALs4sv3xJXJvWwcGk8N_s1mW9Y7GpEz6Bqv-DJO_q7hPi2yTLA@mail.gmail.com>
 <Y4THeSrc0lOJP/AJ@kadam> <Y4TIYx37CiNGDSc5@kadam>
In-Reply-To: <Y4TIYx37CiNGDSc5@kadam>
From:   Pavan Chebbi <pavan.chebbi@broadcom.com>
Date:   Mon, 28 Nov 2022 20:35:20 +0530
Message-ID: <CALs4sv3z8Q0BjunwtoKcSJ8hD8AePtU+sVwgJJEr5gjOGDSd9w@mail.gmail.com>
Subject: Re: [PATCH net-next v2] bonding: uninitialized variable in bond_miimon_inspect()
To:     Dan Carpenter <error27@gmail.com>
Cc:     Jay Vosburgh <j.vosburgh@gmail.com>,
        Jonathan Toppins <jtoppins@redhat.com>,
        Veaceslav Falico <vfalico@gmail.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000dc82d905ee8933b5"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--000000000000dc82d905ee8933b5
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 28, 2022 at 8:10 PM Dan Carpenter <error27@gmail.com> wrote:
>
> On Mon, Nov 28, 2022 at 05:36:41PM +0300, Dan Carpenter wrote:
> > On Mon, Nov 28, 2022 at 07:15:39PM +0530, Pavan Chebbi wrote:
> > > On Mon, Nov 28, 2022 at 4:36 PM Dan Carpenter <error27@gmail.com> wrote:
> > > >
> > > > The "ignore_updelay" variable needs to be initialized to false.
> > > >
> > > > Fixes: f8a65ab2f3ff ("bonding: fix link recovery in mode 2 when updelay is nonzero")
> > > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > > > ---
> > > > v2: Re-order so the declarations are in reverse Christmas tree order
> > > >
> > > Thanks,
> > > Reviewed-by: Pavan Chebbi <pavan.chebbi@broadcom.com>
> > >
> > > > Don't forget about:
> > > > drivers/net/bonding/bond_main.c:5071 bond_update_slave_arr() warn: missing error code here? 'bond_3ad_get_active_agg_info()' failed. 'ret' = '0'
> > > >
> > >
> > > I think that warning can be ignored, as bond_update_slave_arr() does
> > > consider the return value of bond_3ad_get_active_agg_info() but
> > > chooses to not bubble it up. Though the author of the function is the
> > > best person to answer it, at this point, it looks OK to me. Maybe a
> > > separate patch to address it would help to get the attention of the
> > > author.
> >
> > Heh...  That's slightly vague.
> >
> > You're wrong to say that none of the callers care about the error code.
> > It is checked in bond_slave_arr_handler().
>
> If you don't know that's fine also...  All the maintainers are CC'd.  If
> they really care they can take a look otherwise there are so many other
> obvious bugs to care about and this is very minor.
>

No, I did not say nobody cares about the error code. I just said that
bond_update_slave_arr() does care about
bond_3ad_get_active_agg_info()'s return value, takes appropriate
action and returns success to its caller. I think this is the scope
and context of the warning message.
To me this looks OK, but again, the maintainer/author is the best judge.

> regards,
> dan carpenter
>

--000000000000dc82d905ee8933b5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
OltyqaGBuzv+bJTUL+bmV7E4QBLIqGt4jVr1R9hJdH6KxXwJdyfHZ9C6qXmoe2NQhiFUyBOJ0wgk
dB9Z1IU7nCwvNKYg2JMoJs93tIgbhPJg/D7pqW8gabkCAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUEV6y/89alKPoFbKUaJXsvWu5
fdowDQYJKoZIhvcNAQELBQADggEBAEHSIB6g652wVb+r2YCmfHW47Jo+5TuCBD99Hla8PYhaWGkd
9HIyD3NPhb6Vb6vtMWJW4MFGQF42xYRrAS4LZj072DuMotr79rI09pbOiWg0FlRRFt6R9vgUgebu
pWSH7kmwVXcPtY94XSMMak4b7RSKig2mKbHDpD4bC7eGlwl5RxzYkgrHtMNRmHmQor5Nvqe52cFJ
25Azqtwvjt5nbrEd81iBmboNTEnLaKuxbbCtLaMEP8xKeDjAKnNOqHUMps0AsQT8c0EGq39YHpjp
Wn1l67VU0rMShbEFsiUf9WYgE677oinpdm0t2mdCjxr35tryxptoTZXKHDxr/Yy6l6ExggJtMIIC
aQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwV/XkICjVscn4SNZMw
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEINyj553eIiVi7CVksID5tmdioFbWCBsD
+Qnl9NjmESbQMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMTEy
ODE1MDUzMVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQBFao2gCEYQBJzBY92diLDkrBryaI1bwVbfLYuzSFq2JQl4vKzy
MLvtKNMgClB3x4j2r4dxUL0p31s7sE2MGoysNMblX/l8wMpcKkEzgvljBy/bHb7A+op4O8vqT76E
/atTrTL2hhvNVmhaKJHqxRAuEbSJ40u9f4HQbcrEOYwUqaRX0YPzYT3ar3PNEDAzM+/ixHJPGB7O
ClPq0nHYWeu9/ubzn8r3RF9joQQoBSWFJaOEFIpEH+sxJN0zIQM0PFRkQfE3NlFtB4QumH0YA+Y5
9yFgjNTH+SOCfjUZMI3nIdk+AjKp+BGc++vgpoRxoxk3r6vmnB68gk30mnjrNeg3
--000000000000dc82d905ee8933b5--
