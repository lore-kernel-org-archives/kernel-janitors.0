Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A582EB8
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Nov 2023 03:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id EBA26C5;
	Tue, 14 Nov 2023 19:40:46 -0800 (PST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 93BC8609AA670;
	Wed, 15 Nov 2023 11:40:30 +0800 (CST)
Message-ID: <2c0915ab-c9ed-87d3-5049-7e03f3994e4b@nfschina.com>
Date: Wed, 15 Nov 2023 11:40:30 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH wireless-next] wlcore: debugfs: add an error code check in
 beacon_filtering_write
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <878r71vots.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/11/13 20:07, Kalle Valo wrote:
> Su Hui <suhui@nfschina.com> writes:
>
>> On 2023/11/13 14:16, Kalle Valo wrote:
>>
>>> Su Hui <suhui@nfschina.com> writes:
>>>
>>>> wl1271_acx_beacon_filter_opt() return error code if failed, add a check
>>>> for this is better and safer.
>>>>
>>>> Signed-off-by: Su Hui <suhui@nfschina.com>
>>> How did you test this?
>> Only compile test.
> If you have only compile tested please document that clearly in the
> commit message.
Sorry for the unclear commit message.
>> Clang static checker complains about this code that  value stored to
>> 'ret' is never read.
> This would be good to also have in the commit message.
I will add this to v2 patch if pass a test  in a real device.
>> And most of the caller check  the error code of
>> wl1271_acx_beacon_filter_opt().
> This might still break something so I would prefer to test this in a
> real device before taking it.
This might take some time, I try to find a wlcore device to test this.
Thanks for your reply!

Su Hui


