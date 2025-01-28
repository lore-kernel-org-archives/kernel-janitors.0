Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DC31DC04A;
	Tue, 28 Jan 2025 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738056005; cv=none; b=qyeqE1UAKkOq5hJy5xolazuoWmpbTd75DWDsMd0RxWAL/ekBqyCs9s7ebzdVZq4jrqfOanaB+DpW1hcnmp8yzWxchqjicdYgAu/4crv0hJr9c5+dnQgCJZvHPIDEDVJXqIQl217/w+C8qGaY91DcJpgqVHUutoaHnN3K59rG8AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738056005; c=relaxed/simple;
	bh=gkgwn8Aak46Pu+bbQvU6JcXCuB4t5CwZAut71patHVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/SRFraHIsSLg29RM4rQEhN76OqvWlPbodNZ0mYkaT1pPayOOr3aL04aoSeP6Bs+/PNM2QLnFVt04tNDpZvo4Gco0IN9gSLm9pF26QCVaUQcZip+VUD/gCkk/7pd3xd5tVmQ/t1ttayu5evWAxrNJMAZnSmOXRRrcge+/36NqLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yhzjq1Gg4z9sSn;
	Tue, 28 Jan 2025 09:59:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0K5B5nkmMpV; Tue, 28 Jan 2025 09:59:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yhzjq0R7Gz9sSm;
	Tue, 28 Jan 2025 09:59:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E49218B76C;
	Tue, 28 Jan 2025 09:59:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hmBOXfpu_Hkr; Tue, 28 Jan 2025 09:59:10 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D53958B763;
	Tue, 28 Jan 2025 09:59:09 +0100 (CET)
Message-ID: <55498563-eb4d-4475-bf85-1543a59aed20@csgroup.eu>
Date: Tue, 28 Jan 2025 09:59:08 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: init: Unnecessary braces around single line statement
To: Markus Elfring <Markus.Elfring@web.de>,
 Jeremy Dean Clifton <deaner92@yahoo.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Huang Shijie <shijie@os.amperecomputing.com>, Ingo Molnar
 <mingo@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Petr Mladek <pmladek@suse.com>, Raul Rangel <rrangel@chromium.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Yuntao Wang <ytcoode@gmail.com>
References: <20250125154139.7565-1-deaner92@yahoo.com>
 <a0f58c66-2ea2-45ee-a426-5934846990a8@web.de>
 <Z5iHRSUPEQoI2Rfl@vmi2410184.contaboserver.net>
 <5033d386-0765-486d-bf5a-68fe790ee455@csgroup.eu>
 <2ee90f45-0ef2-4c9b-8b0b-79d8c6cde1de@web.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <2ee90f45-0ef2-4c9b-8b0b-79d8c6cde1de@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/01/2025 à 09:45, Markus Elfring a écrit :
>> So ask yourself whether such a change is really worth it.
> Some change combinations can occasionally become more worthwhile,
> can't they?

Sure that change would be perfect as part of a series which modifies 
bootconfig_params(), but as a standalone change I can't see the benefit.
