Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE64EC433EF
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Feb 2022 22:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239908AbiBTWQE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 20 Feb 2022 17:16:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiBTWQD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Feb 2022 17:16:03 -0500
X-Greylist: delayed 431 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 20 Feb 2022 14:15:42 PST
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B77F340DA
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Feb 2022 14:15:41 -0800 (PST)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4K201r4Q0Zz4wwd9
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Feb 2022 22:08:32 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
        dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="u2g8eoH/"
Date:   Sun, 20 Feb 2022 22:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1645394908;
        bh=PSaeiEzIlUfb9ImNQgZnCxzgFtApCnBzTORZq9m/JQo=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID;
        b=u2g8eoH/tkDJFAnzdxpMcmWrIx3wRwdTpR/HCutq1FF+VUmiwcRrFJVrcPllgrd1x
         7lVQoUxhbgx8G8KUjTIny1Ew1vt27L9g8xPQVlMJ2voQoRpPLj6emiTY0no3rnTBnu
         sFGGyiRSBWCfuLECSRDxiTe71rir7Spv/saeRDB5Ev2Hul6gcKdIRSd7dCX8YqiTlp
         Cj/EIJ/8g4SQHN9tlyKTZ1+U5jGLPALvdGB0Bf03vXzHQrUg5KIbwHVpwitKlVY5Ym
         h2OWJYAJHjYhgO/o8IOxjNv0a72ueIoQXgYy5qS9F9rfn7edQSTRQu87bRcPm5m5I6
         lsjR757uCxGPA==
To:     kernel-janitors@vger.kernel.org
From:   Nelson Penn <nelsonapenn@protonmail.com>
Cc:     Nelson Penn <nelsonapenn@protonmail.com>
Reply-To: Nelson Penn <nelsonapenn@protonmail.com>
Subject: [PATCH] input-documentation: Make references to button_dev reflect that it is a pointer.
Message-ID: <20220220220813.23398-1-nelsonapenn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The docs on creating an input device driver have an example in which
button_dev is a pointer to an input_dev struct. However, in two code
snippets below, button_dev is used as if it is not a pointer. Make
references to button_dev reflect in these code snippets reflect that it
is a pointer.

Signed-off-by: Nelson Penn <nelsonapenn@protonmail.com>
---
 Documentation/input/input-programming.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/input/input-programming.rst b/Documentation/inpu=
t/input-programming.rst
index 2638dce69764..c9264814c7aa 100644
--- a/Documentation/input/input-programming.rst
+++ b/Documentation/input/input-programming.rst
@@ -85,15 +85,15 @@ accepted by this input device. Our example device can o=
nly generate EV_KEY
 type events, and from those only BTN_0 event code. Thus we only set these
 two bits. We could have used::

-=09set_bit(EV_KEY, button_dev.evbit);
-=09set_bit(BTN_0, button_dev.keybit);
+=09set_bit(EV_KEY, button_dev->evbit);
+=09set_bit(BTN_0, button_dev->keybit);

 as well, but with more than single bits the first approach tends to be
 shorter.

 Then the example driver registers the input device structure by calling::

-=09input_register_device(&button_dev);
+=09input_register_device(button_dev);

 This adds the button_dev structure to linked lists of the input driver and
 calls device handler modules _connect functions to tell them a new input
--
2.25.1


