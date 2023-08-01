Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7D8EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Aug 2023 06:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjHAGB6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Aug 2023 02:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjHAGB5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Aug 2023 02:01:57 -0400
X-Greylist: delayed 16038 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 31 Jul 2023 23:01:54 PDT
Received: from zg8tmtu5ljg5lje1ms4xmtka.icoremail.net (zg8tmtu5ljg5lje1ms4xmtka.icoremail.net [159.89.151.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 033F7E7D;
        Mon, 31 Jul 2023 23:01:53 -0700 (PDT)
Received: from linma$zju.edu.cn ( [42.120.103.60] ) by
 ajax-webmail-mail-app4 (Coremail) ; Tue, 1 Aug 2023 14:01:16 +0800
 (GMT+08:00)
X-Originating-IP: [42.120.103.60]
Date:   Tue, 1 Aug 2023 14:01:16 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   "Lin Ma" <linma@zju.edu.cn>
To:     "Dan Carpenter" <dan.carpenter@linaro.org>
Cc:     "Markus Elfring" <Markus.Elfring@web.de>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        "Alexander Duyck" <alexander.h.duyck@intel.com>,
        "Daniel Machon" <daniel.machon@microchip.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric Dumazet" <edumazet@google.com>,
        "Jakub Kicinski" <kuba@kernel.org>,
        "Jeff Kirsher" <jeffrey.t.kirsher@intel.com>,
        "Paolo Abeni" <pabeni@redhat.com>,
        "Peter P Waskiewicz Jr" <peter.p.waskiewicz.jr@intel.com>,
        "Petr Machata" <petrm@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: dcb: choose correct policy to parse
 DCB_ATTR_BCN
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220622(41e5976f)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-4df6dc2c-e274-4d1c-b502-72c5c3dfa9ce-zj.edu.cn
In-Reply-To: <d29e7d32-1684-4400-9907-f2f69092466d@kadam.mountain>
References: <20230731045216.3779420-1-linma@zju.edu.cn>
 <fbda76a9-e1f3-d483-ab3d-3c904c54a5db@web.de>
 <3d159780.f2fb6.189aebb4a18.Coremail.linma@zju.edu.cn>
 <d29e7d32-1684-4400-9907-f2f69092466d@kadam.mountain>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5a361992.f3740.189afafbb36.Coremail.linma@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgBHjAmtn8hku11sCg--.56218W
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwUOEmTIYfoAqwAFsD
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

SGVsbG8gRGFuLAoKPiAKPiBTaW1vbiByZXZpZXdlZCB0aGUgcGF0Y2ggYWxyZWFkeS4gIERvbid0
IGxpc3RlbiB0byBNYXJrdXMuICBIZSdzIGJhbm5lZAo+IGZyb20gdmdlci4KPiAKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA3MzEyMy1wb3Nlci1wYW5oYW5kbGUtMWNiN0BncmVn
a2gvCj4gCj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVyCgpPb29vb3BzLCBJIG5ldmVyIHRob3Vn
aHQgb2YgaXQgbGlrZSB0aGlzLiBJIHdpbGwgdGFrZSBub3RlIG9mIHRoYXQgOikuCgpUaGFua3MK
TGlu
