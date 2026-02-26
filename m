Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF23624A8;
	Thu, 26 Feb 2026 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772139475; cv=none; b=rBXFSnFxCM+zLIDMavuxDRCMthUO8x/ZV63ADQc2RPwQSWqH+ZLkEqkaf+x2rymIebQVkyUwJstiJGoEiwojF7R2WVXOMt507cBHaZjha0XRGbsJUOLEbQSqH1+XSfO9GEk1+AfeAOvbBAQotA2F6tlRrUmCHxudAKlz2Fh5s2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772139475; c=relaxed/simple;
	bh=fNGFgs4B82iXHmM4Fjf/KpzSuOE1Qds2OmrzEiXvoJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REqfYeAf5ZvA4gGN8hNgG2yExqDeKmKqwpjtmwu/57WaJW5As94ElsFXLkzneirWz0EwSafLZAHXE/yLQtjz+LbpHrhU1WEMIqzF8jLo22mG+cX1qRJRlP3+Lgb5SnAdoUWz8iWLa/SuXtdOUAEokNa0/XRS2ztuRoul+sS2Zqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Ppx8My7D; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Ppx8My7D"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id viPYv6Djy0h1yviPYvQ3lF; Thu, 26 Feb 2026 21:56:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1772139402;
	bh=XNvxEZUCBvpU8JwtRc1bKvRe9HjTkA50spCCWeLolOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Ppx8My7DW0Tash6fRof9n4+6lWDa8ewK0KusdITyWFkaucykY9/lauiR5Qbu+VhOa
	 LJGQfSqFqNuVnSe7Yuhui2umVN4S7U1CeR77+cFPI16j8ixG61vjMIEZk3srFmdFxx
	 K0d+Ttk9Ccq6ORR3jG0rC/Bvyma32ZRQW/DW4it3UwYqBf78O9XQ47eDx5OFw4jmC1
	 rCQetJ5bua+Ccvk/cqOJJVO6KOWOopEr16NkfP207QpU+49Alj6btvqV8E92ovDInl
	 Z8zf6M4Fm0JcLCkDeypupyMUA0jmb7LeDL3O01Ak7xXGIOgWZjXM66zuATDna+VAIY
	 2zwrmkaixMynw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 26 Feb 2026 21:56:42 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <61cece55-8ab1-4146-a3f5-a2b5d97adc66@wanadoo.fr>
Date: Thu, 26 Feb 2026 21:56:39 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ALSA: aoa: Constify struct configfs_item_operations
 and configfs_group_operations
To: Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org
References: <803ed3c1a19faab6481f3b3b4bf1eb86739061bd.1772138561.git.christophe.jaillet@wanadoo.fr>
 <05f10825418c4e8c12b96eaf9404e4e14ad63aaa.camel@sipsolutions.net>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <05f10825418c4e8c12b96eaf9404e4e14ad63aaa.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/02/2026 à 21:47, Johannes Berg a écrit :
> On Thu, 2026-02-26 at 21:43 +0100, Christophe JAILLET wrote:
>> 'struct codec_connection' are not modified in this driver.
>>
>> Constifying these structures moves some data to a read-only section, so
>> increases overall security.
>>
> 
> The security claim seems like a stretch for this data, but I guess since
> it's never modified making it const makes some sense.

You are right, in this case the security claim is a bit too much.
I use the same template for all such patches, and some times, it is less 
relevant.

The claim makes much more sense when the struct has some function pointers.


Please not the the subject is broken (configfs_item_operations...)
I've sent the same patch with the correct subject.
Sorry for the noise.

CJ


> 
> johannes
> 
> 

