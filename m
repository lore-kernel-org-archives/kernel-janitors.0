Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497F4C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Jun 2022 12:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238614AbiFHME6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Jun 2022 08:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238611AbiFHME5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jun 2022 08:04:57 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60127.outbound.protection.outlook.com [40.107.6.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5F02584C8
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Jun 2022 05:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5WKeEfqJoXLYPec+/uLCZpXgwfV4Ez3fMdWixVgeSiu6hxTFprpEj04tAa5kZdP4xRwBzr4yGHdUfHXzDm/fEWY+vOChfm15eJ4O7U7mUCBMQwLaf5rY3rDEs8R4m+GG3i9DRMDeYTNZk2R3kuB6uPcX1/+Jr78+toTrsCvpZ31JxQ6BqwjMkUAxe+l9F5KQkOCIgmZ/k9aCZHLPf+aj865n16wArnKpc0SZRB8APq58YXJRm1A/IsLnJ3VI6t9Ryo9bcZI7etOAUz87/GQFt1rCeH1W/n++REg8LioqoAJR8fPs2GuLPpbaU2cu39rq7QxEUDW12dnFj8ImPQYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpdA8rU/qT4L2Y7wN0b5OUKLSiyNsMsLO7cEUjcnIqE=;
 b=a+qdGImeuZ5BXJMdXKwhhJwUAaUpo9BMbfNBZBBsuSnfeqVLxgrdQldfp3tGqaF6/pOEJw9NGFcKinEc/cLA2xcYbZr8ACL1+1a8HOFwN98ESY/MLd8/pU5CmyDtoKiiZjnnqqLSlq2sQKJmy4NOqkLyVWIUnbtzDHZL9F8O+kXNqvo0HIhwF77SMH24veWHpQUX4lfeneNziR/XbCyfEl1ukazbjWvj+9XZ4gI1dxNyi4PTqopsnMQhlA69iqvqpJt5MO51eGl7w4ddo7YXqijJRad1fm9uxQQn700wyDrjxwCUfO2FG1DLUpHSR2BzhcR1VBZw/+WxOgDg3tPUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netatmo.com; dmarc=pass action=none header.from=netatmo.com;
 dkim=pass header.d=netatmo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netatmo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpdA8rU/qT4L2Y7wN0b5OUKLSiyNsMsLO7cEUjcnIqE=;
 b=MqHmlp1ETXAuzqobwVFdj1wI9eHgTA84/3r4OcgH5B0Jy4TyJWYwW7UCPo77iltmv7b+4ZwCBHDzQcVDK54c51/AsQNIs18uanw9SvreXO4Bo7vTKb+6mdSX/fwRFgpfT8T3lySK6RpdCvMWa2DiosXVc12krGhmKwS6EYiwWSs=
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 by DB8PR03MB5673.eurprd03.prod.outlook.com (2603:10a6:10:105::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Wed, 8 Jun
 2022 12:04:53 +0000
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::197:874b:24ea:e4d5]) by AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::197:874b:24ea:e4d5%5]) with mapi id 15.20.5332.011; Wed, 8 Jun 2022
 12:04:53 +0000
From:   =?Windows-1252?Q?J=E9r=E9my_LEFAURE?= <jeremy.lefaure@netatmo.com>
To:     Julia Lawall <julia.lawall@inria.fr>,
        Markus Elfring <Markus.Elfring@web.de>
CC:     "cocci@inria.fr" <cocci@inria.fr>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [PATCH v2] coccinelle: ifaddr: Find address test in more complex
 conditions
Thread-Topic: [PATCH v2] coccinelle: ifaddr: Find address test in more complex
 conditions
Thread-Index: AQHYek7fHLsMc4LTfk+02uWH++YB5q1ERYKAgAASjwCAARMGRA==
Date:   Wed, 8 Jun 2022 12:04:52 +0000
Message-ID: <AS8PR03MB76038B2D2E451F0A07AEE4D093A49@AS8PR03MB7603.eurprd03.prod.outlook.com>
References: <AS8PR03MB760365A0DE3A8522136471BE93A59@AS8PR03MB7603.eurprd03.prod.outlook.com>
 <415ca02b-9618-b447-6471-6bcd0e2215e8@web.de>
 <alpine.DEB.2.22.394.2206072138160.2960@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2206072138160.2960@hadrien>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netatmo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8658a2c-9e90-4308-bc90-08da4947188f
x-ms-traffictypediagnostic: DB8PR03MB5673:EE_
x-microsoft-antispam-prvs: <DB8PR03MB5673CA8B98B1C62B50EB6A6B93A49@DB8PR03MB5673.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RNq4yEBsCl/e4BducuAF1vBB1tv4WhupMpZAmSJeOWVqUxfLAlltc5cOHJmAXdNq6cLBWsHjg/8ISGyuqrVTqFDK6ZCsZeo6inOfqqnk2yQ1P56w6eg/d13uAHL33N6AFQ3/Vce67w/cBFsWDCF2TuI6WNuhyMPM04dkaB4/DvuVUGjq1N/wJK8GLBeZgz/5UozPF96axbWXfscdhSfoL3NDsTa1GRJ6DMOydeqJBUV8ogePUlbcwgEBUmUBhZM0Nl4PL8JPZaeyNS9WzDieIIi0YZoBmwIQZrrX4BR04BEUTYWcjQzX2wFw7TKy2pNEGq8A+0NFtbFulDDB8ixhe0WS1QppilMotIMHowP6Zo1vid7CG+q0bpnfkT/24kg+su3hf/NpFRRzOx3wr2Lvro7SerA5vAhDvZ8/r9SltNo8nuVE50HuFAkjAysHrV1UWOeuGHmXQtmXTTTD+1m16kUEJ5xawOJ9ISerSb3HzSpRz+3UyU4yacXKxI8ZWyapVtwODFP0Bd24ulCOdpQwDjEMbIibyq35lJZYzGaPSIPwHnj9quvaZneixzlgBhCIgs/nrbzR0T5txax1BLWMgVvHxh28bi5ShJGwMbOXe8/qVZD6k2CBAMHv6VQBhajWx2hVs6V+LCB/hodZ8tmmGd7rDpXhI0PnnCIcE7EvibWVafTCnAa4Ja4qL8unCSMuX0pPWZ8mGBXNyYr0lsNYCA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(346002)(366004)(39850400004)(136003)(396003)(8676002)(6506007)(66946007)(53546011)(64756008)(38100700002)(66476007)(33656002)(7696005)(76116006)(91956017)(86362001)(4326008)(66574015)(55016003)(5660300002)(55236004)(71200400001)(186003)(2906002)(52536014)(66556008)(66446008)(508600001)(83380400001)(54906003)(9686003)(110136005)(316002)(26005)(122000001)(38070700005)(8936002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?tanPr7vY5biYx8+/kJddDnXFMFLI/8Nxhprt2QbZguj7/sxJZGAWwSyB?=
 =?Windows-1252?Q?H+akENWYdHLYA3hTLyN58pwDQ0mNckCI+2t0XeDjxh32OONNLrfFNHdL?=
 =?Windows-1252?Q?+oj5CUMOJPEFOfwNQoMIKp+VO38Fdr7OYrY7fHAbgxzX7autmi8oKsIv?=
 =?Windows-1252?Q?EhfwwWPLpbIGbeYFU4HJSscGI148cTMuSOubuOnu5oYV0jPrkdz6/jsJ?=
 =?Windows-1252?Q?Smq4kktDoZLZFAEzS30I336noLOwa3q/XBooZvaNamZS/MQyWcVagA1D?=
 =?Windows-1252?Q?/9KLZvMNwcPypcF7IpIk4dLil/O7aoJTbpPQY1kBvwfrYrCr1SENWleH?=
 =?Windows-1252?Q?rYNdOQ9ff2MkEfnb5wRODSbGzNd3x7L7phlNuI06jl6IRJHvdBXfJSsY?=
 =?Windows-1252?Q?En5+bZNz7gt6OHMCVN24fUpXugW4U957BjEdWVw2xXNC5gOqd+upRXIo?=
 =?Windows-1252?Q?OgQ8FE/Q0MZI/m9f9bVahCRCyyfMLk4rTAW4eBG2q/v0uabPSOnVE+QD?=
 =?Windows-1252?Q?Nv2DI1gYXzf7RTUoum3RlXe8KcQyi8Eh8i5Ho93/stzdAEiIpbknBbbg?=
 =?Windows-1252?Q?aBI0hx9R16tmUsHe0lU+BZzXVON2ww9PyZWHa3WwxmyNjIM9z9KgBUDx?=
 =?Windows-1252?Q?2q16yP4taZT3tLRMWKOj3j+lVPtv2e0sNMUaFxXF6iOX9rr8ZtpOaRnp?=
 =?Windows-1252?Q?Q17vE4mrigzHViIKtSwBVUSY++AagI9XHLdhDyAbAB31aSq1IfDA0JQP?=
 =?Windows-1252?Q?xkva1Fv/QEBZKdxVMJ/XCqC8jigu4XKZVBw98w7b4y+fVrJElhsizlgd?=
 =?Windows-1252?Q?undcgzCi0vN5/8fitCiiTaikg0c2vFSBSmvvCZftNwIVTLDT62bKKS4Z?=
 =?Windows-1252?Q?oempj0qVZMKh+2xHTqNNFbOkyOfe16YejBKPjDaAhRPTKW/pbldll5Zt?=
 =?Windows-1252?Q?d0iVdD+HmB9AgATb4vZMWHHZ1rUGQr0Qf4JdiDwhi5tp3T2E/ZHVmrjM?=
 =?Windows-1252?Q?KGhJJCtSxbTaGvbZtNTndG/zKybvgPIKLhyFOjw4F0njLrN6FQgMYYMr?=
 =?Windows-1252?Q?y2IP0X70w0O93uCVWmBwHUz+I/Hm6mG/mX+wPIAdqflsIDxfeDqje+fj?=
 =?Windows-1252?Q?YCAX6bNyrW+udAzNhH6FrEAQfTBniDwuR27l0g+IEDILoqCgr4BKiQxA?=
 =?Windows-1252?Q?CkqtQ1WKJ6N/nD1au2OnVkq1TP09lofxDDOAdvU1i8F1VSaHt1IpGn9P?=
 =?Windows-1252?Q?7eIm9jFU4keHkQDjH/JgQbo9ZXzFdhr9mj2XLZfa+LIW5LUX8xVeBztj?=
 =?Windows-1252?Q?R9fVC/pth4H+3JUZ39CnojjOM/TF+rJzyHhFVvz9wry9X8byACLoCg6A?=
 =?Windows-1252?Q?DNKnLzYRYxCfv7GwindMbv0No7WXnpXKkWgRKyXOn7IE5ytcmuMPcYWv?=
 =?Windows-1252?Q?D3075QFqdbH14XREzAD8gMsh4Aqbw5nuuAA7k7BrhpEhE/0Va5YWdkVi?=
 =?Windows-1252?Q?Q2VTf8zBO2HMRmEb54xD7Vgv1P5O5ooBlpAduTMvCCA3jq56bd/IT9Qu?=
 =?Windows-1252?Q?AXcV8iQd0NLOySrp8kkezEYYYtqKNaV4liJvo3SfeJTSCvEa0SS28G8O?=
 =?Windows-1252?Q?24kF7Dsqdy5YqSKVcfkx6rZ6s+XY4PD7qNCqQIbi1aD488OjX2oOj0Aj?=
 =?Windows-1252?Q?F98KA7Kd/YXvTry6US8vFcZ44WsrbQzncucCFOPPgnCxU8peiRAfNxwZ?=
 =?Windows-1252?Q?TCpkiA5FiSzAO536t45AGnPpBIHpGTrIJ7S1Cgyn5JjMscFJ8b5UlTEm?=
 =?Windows-1252?Q?9gAV+kRjswS70NwbfbilW4E3/Wihi1mRXoPYn+tY+oUc8JqzvugPeZg4?=
 =?Windows-1252?Q?ZgzKztJqGMGiEsSX37JVe8Hym5afw7l4evQ=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: netatmo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8658a2c-9e90-4308-bc90-08da4947188f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 12:04:52.9613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4528446a-2666-441f-95cd-cc2cbd9f2c49
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQlJYyCXZwjerrjUxtYQ/bPtGcukt6gfvwHZhJAsgLikALAMY/eN7glUKIEfFtbU5eA64cRiaAQYgeTT7/B++39sejEuty8nh4HL/Ic+Hxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5673
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> I don't really understand the above, but it made me realize that actually
> the following is sufficient:
>
> @@
> expression x;
> @@
>
> *&x || ...
>
> This forces &x to appear as a test expression. There can be 0 or more
> occurrences of ||, so eg &x && y is also matched.

That's indeed better because it allows to catch issues in tests that
are not in if statements (such as loops). Is it ok to rename this file
to test_addr.cocci in the next version of the patch to give it a more
appropriated name?

It also gives a better line indication for conditions split on several
lines.

I also noticed that with this change the semantic patch catches tests of
addresses in if statements when likely/unlikely is used, for example
if (likely(&a)). This was not the case with my previous patch nor with
the current semantic patch version on master even though the isomorphism
unlikely(E) <=3D> likely(E) =3D> E is in the standard.iso file. I don't get
this behavior change, do you have any idea why it didn't work?


Thank you!
J=E9r=E9my

________________________________________
From: Julia Lawall <julia.lawall@inria.fr>
Sent: Tuesday, June 7, 2022 21:39
To: Markus Elfring
Cc: J=E9r=E9my LEFAURE; cocci@inria.fr; kernel-janitors@vger.kernel.org; Ju=
lia Lawall; Nicolas Palix
Subject: Re: [PATCH v2] coccinelle: ifaddr: Find address test in more compl=
ex conditions



On Tue, 7 Jun 2022, Markus Elfring wrote:

>
> > The test of an expression's address does not necessarily represent the
> > whole condition, it may only be a part of it.
> > This change aims at detecting an address test in more complex condition=
s.
> >
> > Signed-off-by: J=E9r=E9my Lefaure <jeremy.lefaure@netatmo.com>
> > ---
> > v1 -> v2: Moved disjunction on the condition itself instead of being on=
 the if statements
> >
> >  scripts/coccinelle/misc/ifaddr.cocci | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/coccinelle/misc/ifaddr.cocci b/scripts/coccinelle/=
misc/ifaddr.cocci
> > index fc92e8fcbfcb..14dbf3131a3f 100644
> > --- a/scripts/coccinelle/misc/ifaddr.cocci
> > +++ b/scripts/coccinelle/misc/ifaddr.cocci
> > @@ -18,7 +18,7 @@ statement S1,S2;
> >  position p;
> >  @@
> >
> > -*if@p (&x)
> > +*if@p ( \(&x || ... \| &x && ... \) )
> >   S1 else S2
> >
> >  @script:python depends on org@
>
>
> Would you ever dare to adjust the specification another bit for such
> a source code search approach according to the difference in the selectio=
n
> of the operators =93||=94 (disjunction) and =93&&=94 (conjunction)?

I don't really understand the above, but it made me realize that actually
the following is sufficient:

@@
expression x;
@@

*&x || ...

This forces &x to appear as a test expression.  There can be 0 or more
occurrences of ||, so eg &x && y is also matched.

julia
