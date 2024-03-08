Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB6134A9
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Mar 2024 06:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709879976; cv=none; b=E8JzkyL9ShcCL8VIBEBNIjnWZi1udVyO55ONTLrJxwi0nS/bqhqEEIMveUubz04VIrFy8PkpzMd1lG1TTl8p0qxkYlwC/Bd43XppZwTdpJZGjqsM35xHVje/X7cQUdXaG0nmV34weHQlgEEzmos9PgZQa9FlyVBAhGA3ieJTyBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709879976; c=relaxed/simple;
	bh=ZnEIIn8cQ0wfZE9v4L8hG51HQtqAhWYwi0Q3L85DRMY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pSFHzaHAAg995F4q1d9HOkc32plDgN1gwDPpr1J7sarsAa5i+Rqpeu/lxmcAtFLnC7lh/mT7NLLbs2EPvuDd3Dy1/8lE8jILrcKXxBBLlxLywg4z9AEGJv7ujkemhU8bIbdA9ELiwrdM9BcUrJmK9DLUwctnNMf/XzXSIdnnTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=B1fuZPDs; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="B1fuZPDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1709879949; x=1710484749; i=markus.elfring@web.de;
	bh=ZnEIIn8cQ0wfZE9v4L8hG51HQtqAhWYwi0Q3L85DRMY=;
	h=X-UI-Sender-Class:Date:From:Subject:To:Cc:References:
	 In-Reply-To;
	b=B1fuZPDsdF5VqUX9H66ht76Sz4NVxjbKakzGH+U8rJt56oE66WtoL0oJibRzBxV8
	 jvc8dxlnK5zefcTAOOKC04kO4b371Aq4U4+o4rO5fUR8Za1w4gEfUJIuFnBSvK2Mb
	 +YOPUHZSuEM6x7xUaQlc7cKA1RbMX8uVsHFrQaRVQdG/DC35UCe+1J30rsMDgho6X
	 6/evgfvMetzqtP47s/PD+F3B1U1eAx71MmlILsqUTaBdrnwLh25oVHQdclNpdrOJK
	 FQc7Pqu7u3NJ4GASaHjhPuHv2C1p7DA+anK10px3+T/JG7zpK9J5bz468ix5lLZLN
	 4N7PoY3YMtoJikap6g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mkmzl-1qywra2ULn-00mG1n; Fri, 08
 Mar 2024 07:39:09 +0100
Message-ID: <e02915e5-e5a1-4365-8d09-3bae25b2d8ad@web.de>
Date: Fri, 8 Mar 2024 07:38:54 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [cocci] question about kernel cocci and cleanup.h
To: Jesse Brandeburg <jesse.brandeburg@intel.com>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Alan Brady <alan.brady@intel.com>,
 "Jacob E. Keller" <jacob.e.keller@intel.com>,
 Przemyslaw Kitszel <przemyslaw.kitszel@intel.com>
References: <CO1PR11MB49149F1167679926A2917E0997202@CO1PR11MB4914.namprd11.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <CO1PR11MB49149F1167679926A2917E0997202@CO1PR11MB4914.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LbBbqlcalE+25TSItXEPS6N6VJNF4aRVgYjS6a7lDJUjiRc3b9d
 XCTKxWHwoRvXKs9sMxEZqWVuz+q6gZT0crfgkLzCmZWMJi86yLQOs1Ez+ktfRjPsNV83h8B
 HH5oTnRHohefOSYwagWHOXIq2iGeIDfa/TYFgDRetXU6LjdhwRW9smLUl2xLPmM6l1MEIMl
 rpYhDh9eh3WFPc+wqVnkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:e1zK2ike2ms=;3B2zKGEFgNnr8DltSwnFkFGQnRC
 qCDrS0MrEDblC+9cFuPNt0s6XT17eDtP0tu4TC6YL4KPpsG6zedsfkNw2wU0goYTEKkbSdEgD
 ATBr+kSLVzEW8lSC0bQzJHHJeMLS5aKOO+wU10EgZalcYHZJZn8lKbDAi54JZVBwndsKQBZSB
 sekK0kpM5P8d1tru2YgnoRIy3oLitVqGlj7Sze1DxQMYgWLMdr7a7pVkVGgGJUg2g1njPKMyl
 nuXZKXMrO7FVKIe9fzDv36bz0ctVWK98JHNK8JMA6wa4fS9FJidSjG5wey6saGXlOO2ILRuyC
 qRmefG0Vv0AJKYfWEhjtUbCbnp7LRQOO5LsA7GI+j70b8eYIy054nRmhb8EB8Eholk9AhTc5A
 AXYJZ3/X3sjnSDRavRyvfyfnwxpmtumabv9EqXrZSU7f5MbB45Ix9KrVShST82bEePHNgSF/X
 oNXJli6RhPKcv3iIx1yVkFQRFY+VVOulQMlD0cn7XGZ9TLAIbEv4orlC+LEOMSehzNcjkXo4c
 ZKxbS1Xu4hoYVm+2ohgPrgvkxfp5dwb4DQtqcShJzwRSFxKiSMF8BxOLS0d4uAck0wYAeXRjR
 W8FseTIVLiH5+qNN7WhEQNjFaX/rnSyoTfZYqlBysC2hBHXPmF681KM9f39/TVbz751H/e9ym
 v+dQOI1AJFPmVbEZ+UqAbQbUaC+Yo9xEnJNcOvd3drIYFl9RLCFb7zy4voo3OaVsfVMWKglyt
 7HKTatJ9WoiuhO7Y3Z100xXn4qfdEZa8lrrx4C9pv8ezETjUx7mQ7lN71NsWvXwrIrkXOrmkW
 3UOfUUS25yIrjxHlXDUoodmS59YhGKNfZMXZYJm0XV3gM=

> Hi Julia and team, I had a question about whether it=E2=80=99s possible =
to use coccinelle/spatch to start to identify functions which are able to =
use inline destructors (__free or DEFINE_FREE()) from include/linux/cleanu=
p.h

Generally, yes.

A specific cleanup function is mapped to a selected pointer type.
Will any more collateral evolution happen according to the usage of =E2=80=
=9Csmart pointers=E2=80=9D?



> To some extent a missing kfree logic is already part of the scripts/cocc=
i, but what I was curious about is whether spatch can find

Further applications of the semantic patch language (Coccinelle software) =
have got
a lot of potential.
I find the corresponding data processing and development resources improva=
ble
in various ways.


>  1. Function that allocates a stack variable which is a pointer (or has =
one passed as a pointer argument)
>  2. Function calls *alloc
>  3. Function calls kfree() before return in all paths after alloc

I got the impression that advanced source code analyses can be very challe=
nging
for such cases.

How will knowledge representations evolve accordingly?


> I know this would be nearly impossible to auto-patch, but having a =E2=
=80=9Cgrep=E2=80=9D for this pattern would be super helpful.

Can the support grow for such an idea considerably?


> Would someone be interested in looking at this for the kernel?

Yes, of course.


> It seems like a valuable help to find refactoring locations.

Would you like to help any more to benefit from known adjustment possibili=
ties?

Regards,
Markus

