Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230A3C8C7C;
	Tue, 26 May 2026 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805753; cv=none; b=IR66lwikSXVlaWDC7h0e+YLafzvlRA9NI2VAFHq1021/3696P2BxAVeQFCT7CfrfseJ+JNwewi2rkpKjZA49oObmQzU1ERLj2WuDKcRiVHYJmVxf1K6KkQnzTEWGpHg6U7UaWorKvWqtIX27CDEQ5QGQKxXaBsV7we2PIVME21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805753; c=relaxed/simple;
	bh=UuSnhUjIcOhhGulyTpvTIXNEQpk+pCZo50PC+uJuoMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OD2NCFVdSLlxfQRbn3njhPefFOhF7ECOIURU+6ZvQhk7u7fuML87XaMqGqfGF5HStT+XsW/myE9+kYV+2H9cVrmziQPvVTBHuQEjcS6xBmIf6cfVzWlsA4nZthx9schkoVyLd7BJrJaiMzaCvbD1jQ65QlIYAxK3gDCE7nxFsUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsGfLRgP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsGfLRgP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614C81F000E9;
	Tue, 26 May 2026 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779805751;
	bh=wklCd3v6JOyQtl/8XmoF0/jZjW9BD+xJ57p9amgCcMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EsGfLRgPzzHYTSWqnUltz5MGLfSYx5fAxBozAwB9v+7rtJqf4vnTYpIa4lDLE8ejO
	 yBK5IWkeaAoPWujLhKolWc6qf438FmAMdXbB6CE4qpTV4aFsqUByFkSZaAigT9uBkJ
	 yUK/Noh7Dzibd6gsPoqRRXhnubUe4MjOy4LPp86n9iKzpKFTKPJCvfHBJGhwPRWRVT
	 KpAg/lu5zZg3NHsQWqOdPc2ikXBRUG/gagD9hXaegcCquOf5CEoCxmsJEt8mGYi3O5
	 39Q/HNXZ/rbYUyM+uVuzJLQGSPE8HpEJmah+4Dh+8ifD4synrrIHiM690eOINnh7OD
	 XCoiz631rlphQ==
Message-ID: <dad634f3-f3a5-4a6c-a90d-76356a28ce63@kernel.org>
Date: Tue, 26 May 2026 09:29:10 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: stratix10-rsu: Fix NULL deref on rsu_send_msg()
 timeout in probe
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 Tze Yee Ng <tze.yee.ng@altera.com>
Cc: stable@kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260521031415.3247663-1-dinguyen@kernel.org>
 <2bc78c8a-191f-4657-9ed9-a271c86a4b92@web.de>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <2bc78c8a-191f-4657-9ed9-a271c86a4b92@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/21/26 11:33, Markus Elfring wrote:
> …
>> Apply the same cleanup pattern to the remaining failure paths: remove the
>> async client, free the channel, and return early so no further messages are
>> queued on a channel whose scl has been cleared.
> …
> 
> How do you think about to avoid a bit of duplicate source code
> in the implementation of the function “stratix10_rsu_probe”?
> https://elixir.bootlin.com/linux/v7.1-rc4/source/drivers/firmware/stratix10-rsu.c#L715-L807

Excellent suggestion.

Thanks,
Dinh


