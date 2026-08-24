Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467851AB6F1;
	Mon, 24 Aug 2026 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572141; cv=none; b=A1qCgTKnUCJowGcHlxtzid2ql5s/XEMblZrfvP7Xx4Uluc1VQui2J7I3LqHv6skoJJHuVqjRSnMcWTQ9CtkOobfUU4T6nPoo7iYzbstApgyRDKrTOeVoB19SOWszDMOYeDLuZsHmm89Qgtl6dh3WZhs+H8IDhPBw5C93gcXC52k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572141; c=relaxed/simple;
	bh=FUTULkw4sbTU30itVTCBK3ANXD7XisKmmUJJlXOZQsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7WONnQTfdM8moTpCiy5/RQxYD+ujhs55soKj+czNDDSVpzJyPHEcOLMzNUDfKjEmK/K9Eoj7JICkZCPx7w7mUsO7e/gIDD6ElZmGv4QmSi6SnYVBnBh8Ze3ZPHpxPwb370Xxh6hFy3LBqj49TUO7+0+dcWM3oAwm20MW/gJX2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=npev5eRc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="npev5eRc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B1441756;
	Mon, 24 Aug 2026 04:48:53 -0700 (PDT)
Received: from [10.57.70.220] (unknown [10.57.70.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7461C3F66F;
	Mon, 24 Aug 2026 04:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787572137; bh=FUTULkw4sbTU30itVTCBK3ANXD7XisKmmUJJlXOZQsc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=npev5eRcYxB8WWc3bqFPpFzAeRE0kdm6uSQsep5ImOyqAt3VY2jrqsiKwEwBwrMMd
	 2OZ5V0N0ak8uQ3V0tnhJnQUDSDnME5yOLd2fDnCL1FCZ0dPbALqLqyGxPYFU51Ca1z
	 ZTV+BQkVhCEOgo+TTeWn6hd2sS5XJN2lSNolKVK4=
Message-ID: <566ce354-88f0-4e68-86a4-a8d68bb65254@arm.com>
Date: Mon, 24 Aug 2026 12:48:55 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: arm-cci: fix device_node refcount leak in
 cci_probe_ports()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Manush Prajwal <manushprajwal555@gmail.com>
References: <6a887550.f7f62383.10ed1b.5875@mx.google.com>
 <5bd32eba-881a-4395-841d-909536262dcb@web.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <5bd32eba-881a-4395-841d-909536262dcb@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-08-24 8:00 am, Markus Elfring wrote:
>> cci_probe_ports() has two device_node refcount bugs in its
>> for_each_available_child_of_node() loop over "cp":
> …
> 
> How do you think about to add any tags (like “Fixes” and “Cc”) accordingly?

No.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v7.2-rc5#n15

> 
> See also:
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.2-rc5#n145
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v7.2-rc5#n34
> 
> Regards,
> Markus

