Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39B6C74A5B
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Mar 2023 02:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjC0C2S (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 26 Mar 2023 22:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjC0C2R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Mar 2023 22:28:17 -0400
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D44E98
        for <kernel-janitors@vger.kernel.org>; Sun, 26 Mar 2023 19:27:55 -0700 (PDT)
Received: from [172.16.75.132] (unknown [49.255.141.98])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4E4F620033;
        Mon, 27 Mar 2023 10:27:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1679884069;
        bh=uFGAvwyrYhQY4AMr1setys0PCC4Np91HrNpE2rcuwZE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=HW/tyoTtIbgk8W6rWr9nJtBNg1T2mEiF8A3xvPhVWcPPffJS3cZlg0uidhfEKHdje
         uKMCOXN1t4DlZrGgoy1iMPigtXUfNiR+EXBUTgFr6lrTQk4uTtCZFco1ZPJatVh75D
         xREjoyR+nFmBwLNaGt7AAklvwQIZd/KQYBOs23DZftqwbM8SgYUPZFCa1ZZ0BngliT
         6DC1XmLujwTcZWNKJjD5Lae7z/PBxNcVhD27ig1nwoODw6HCF5qAfVXwsNOo/y1BLV
         r20G+DCWnDsduAKPWaY5VOGZAwh41vKV0QlyDzXOihK0gxj21bUww30TxcH8ZqFe8F
         5PKCPnIobEZ6g==
Message-ID: <b3d855c27656392984a95873c991540396068eb0.camel@codeconstruct.com.au>
Subject: Re: [bug report] mctp: Add route input to socket tests
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Dan Carpenter <error27@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Date:   Mon, 27 Mar 2023 10:27:48 +0800
In-Reply-To: <4ad204f0-94cf-46c5-bdab-49592addf315@kili.mountain>
References: <4ad204f0-94cf-46c5-bdab-49592addf315@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

SGkgRGFuLAoKPiBUaGUgcGF0Y2ggODg5MmMwNDkwNzc5OiAibWN0cDogQWRkIHJvdXRlIGlucHV0
IHRvIHNvY2tldCB0ZXN0cyIgZnJvbQo+IE9jdCAzLCAyMDIxLCBsZWFkcyB0byB0aGUgZm9sbG93
aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOgo+IAo+IMKgwqDCoMKgwqDCoMKgwqBu
ZXQvbWN0cC90ZXN0L3JvdXRlLXRlc3QuYzozNTcgbWN0cF90ZXN0X3JvdXRlX2lucHV0X3NrKCkK
PiDCoMKgwqDCoMKgwqDCoMKgZXJyb3I6IGRlcmVmZXJlbmNpbmcgZnJlZWQgbWVtb3J5ICdza2In
CgpbLi4uXQoKPiDCoMKgwqAgMzUxIAo+IMKgwqDCoCAzNTLCoMKgwqDCoMKgwqDCoMKgIGlmIChw
YXJhbXMtPmRlbGl2ZXIpIHsKPiDCoMKgwqAgMzUzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgS1VOSVRfRVhQRUNUX0VRKHRlc3QsIHJjLCAwKTsKPiDCoMKgwqAgMzU0IAo+IMKgwqDC
oCAzNTXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBza2IyID0gc2tiX3JlY3ZfZGF0
YWdyYW0oc29jay0+c2ssIE1TR19ET05UV0FJVCwgJnJjKTsKPiDCoMKgwqAgMzU2wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgS1VOSVRfRVhQRUNUX05PVF9FUlJfT1JfTlVMTCh0ZXN0
LCBza2IyKTsKPiAtLT4gMzU3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgS1VOSVRf
RVhQRUNUX0VRKHRlc3QsIHNrYi0+bGVuLCAxKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXl5eCj4gVXNlIGFmdGVyIGZyZWUuCgpZZXAsIHRoYXQgc2hvdWxkIGJlIHNrYjIu
CgpUaGFua3MgZm9yIHRoZSByZXBvcnQhIEknbGwgc2VuZCBhIGZpeCBzb29uLgoKQ2hlZXJzLAoK
CkplcmVteQo=

