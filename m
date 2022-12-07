Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1365C352A1
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Dec 2022 19:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiLGTlg convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Dec 2022 14:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiLGTlf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Dec 2022 14:41:35 -0500
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FD56A756
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Dec 2022 11:41:33 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-260-pV07bQ90Ohi80uMg5-apIQ-1; Wed, 07 Dec 2022 19:41:30 +0000
X-MC-Unique: pV07bQ90Ohi80uMg5-apIQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Dec
 2022 19:41:28 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Wed, 7 Dec 2022 19:41:28 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Dan Carpenter' <error27@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>
CC:     "David S. Miller" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH net] lib: packing: fix shift wrapping in bit_reverse()
Thread-Topic: [PATCH net] lib: packing: fix shift wrapping in bit_reverse()
Thread-Index: AQHZCjZqBgI1B5Syy0irkj3BMkR5965i0tSg
Date:   Wed, 7 Dec 2022 19:41:28 +0000
Message-ID: <731cbeda249d4aadbcc3d1cbeaaea750@AcuMS.aculab.com>
References: <Y5B3sAcS6qKSt+lS@kili> <Y5B3sAcS6qKSt+lS@kili>
 <20221207121936.bajyi5igz2kum4v3@skbuf> <Y5CFMIGsZmB1TRni@kadam>
In-Reply-To: <Y5CFMIGsZmB1TRni@kadam>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Dan Carpenter
> Sent: 07 December 2022 12:21
....
> > > -		new_val |= (bit << (width - i - 1));
> > > +		if (val & BIT_ULL(1))
> >
> > hmm, why 1 and not i?
> 
> Because I'm a moron.  Let me resend.

Since we're not writing FORTRAN-IV why not use a variable
name that is harder to confuse with 1?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

