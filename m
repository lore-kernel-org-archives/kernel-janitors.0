Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7B535FCC;
	Tue, 22 Sep 2026 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072630; cv=none; b=d/JLEwT/0KbA5OElfZlpLmf9e41yVRTIZ+l3zNiscvTjLzVW3bkHQu4sgzAK1QFADqG0Vde9LTVP46A6JTYd/VdY3VGVSkq5MYuSUPHJK7IwvIOARna7TbdfrhI86R7FvLV5SQDCacrDjfZVMmytlrlKRzo+OMmTPOHO+7rUTBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072630; c=relaxed/simple;
	bh=5ETbR7LrsYH1VsIEbyCno9odRu49OBHBAoK3jUHIykE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MR52RCNNRcYPWx2/4gBb+FPfpFzgYDon/CbT/IA+efJ2/35sMoNG3CgkXydSNSVhqxwPqFSfWqq2xYPDhqrwX0d5GV6ehROosin4CI2Y2y4/dutvL4OoiTWKU9NTjaxpckoLK+/37Z9/+zyizFBK8hY+zXKqVAXP92U6pkfQK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV69P6Wu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV69P6Wu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE72F1F000FF;
	Tue, 22 Sep 2026 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790072629;
	bh=G2ZZ3jPoCQgZ035xQBboMsxg7LDoIyZLuMyVj0W21Gk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nV69P6WumOQzOIviEfkVLpeS/fz06hZd48XOj0W//UAILYv9kAYpClfua4Hm9SEza
	 Q7bNkF/PRNGhnfovkHCs3GV5sdnGBfmZvcGJoMMBORkqXWSIHr/zPrnuj4MLMIBiQm
	 rcfct8ZaVROl3f4B5icews0AIIRKQNfPEd8wS2KnKMow+z0Sj4r+UPjk/7utKqlOaG
	 6Wg0SOojMN9dcatWViHhZMMfw0NE6UJHOUc2NVBt68yB1MqUNcR9B07p+34XAndXuQ
	 faYTabLvy09I3dOSvDbcR2fgPQsVW15MB1MULS86SNhCECtcV4e1VbgVi0WvR3gW1p
	 qov4e3CVjkw+w==
Message-ID: <59f78064-0e0d-4e3e-9ca3-f057e70b44eb@kernel.org>
Date: Tue, 22 Sep 2026 12:23:44 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] soc: fsl: dpio: Use scope-based resource
 management in two functions
To: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Roy Pledge <Roy.Pledge@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <709fefd1-821a-4cd1-8598-b1179a95ce52@web.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <709fefd1-821a-4cd1-8598-b1179a95ce52@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/07/2026 à 13:36, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 29 Jul 2026 13:28:09 +0200
> 
> Some adjustment opportunities were picked up.

Feedback from sashiko has to be adressed at least, see 
https://sashiko.dev/#/patchset/709fefd1-821a-4cd1-8598-b1179a95ce52@web.de

Christophe

> 
> Markus Elfring (2):
>    Use scope-based resource management in dpaa2_io_store_create()
>    Use scope-based resource management in dpaa2_io_create()
> 
> 
> v3:
> * Dan Carpenter requested to add an #include directive.
>    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fkernel-janitors%2FamdBqQfIsAjxMsqX%40stanley.mountain%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6bd2db2a294b450f9afe08deed65baaf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639209218359212161%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=6%2F8aUajE%2B%2FNYTpo%2B09SVBa9lbZez3WYGUhtpdSTYF4w%3D&reserved=0
> 
> * Ioana Ciornei requested to keep variable declarations at the start of
>    function implementations.
>    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fkernel-janitors%2F6woig227u5snmdsrjfuw7gfcf3vk5iwaap4yf7ow6b6s3pba7z%40yg4vmdoaak3h%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6bd2db2a294b450f9afe08deed65baaf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639209218359235520%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=icEeNsVtx34DKgqjmsDjR3QUqqmeSh1o7gWr5PJYFKo%3D&reserved=0
> 
> 
> v2:
> Christophe Leroy requested to apply the attribute “__free(kfree)”.
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fkernel-janitors%2Fd95d2f4c-f3cf-44eb-b61b-79ba7891674d%40kernel.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6bd2db2a294b450f9afe08deed65baaf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639209218359253601%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=wx8iGxIWhoBQPzSqd2fsa4eeZV9DTQ9pEBL4AWxLcdY%3D&reserved=0
> 
> 
>   drivers/soc/fsl/dpio/dpio-service.c | 37 ++++++++++-------------------
>   1 file changed, 12 insertions(+), 25 deletions(-)
> 

