From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 25 Feb 2019 10:59:26 +0000
Subject: Re: [PATCH] ath9k: remove set but not used variable 'acq'
Message-Id: <877edom8vl.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190225033246.127410-1-yuehaibing@huawei.com>
        <87lg24urgq.fsf@toke.dk> <87ftscmbh7.fsf@kamboji.qca.qualcomm.com>
        <87imx8uor2.fsf@toke.dk>
In-Reply-To: <87imx8uor2.fsf@toke.dk> ("Toke \=\?utf-8\?Q\?H\=C3\=B8iland-J\?\=
 \=\?utf-8\?Q\?\=C3\=B8rgensen\=22's\?\= message of
        "Mon, 25 Feb 2019 11:49:21 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Toke Høiland-Jørgensen <toke@redhat.com> writes:

> Kalle Valo <kvalo@codeaurora.org> writes:
>
>> Toke Høiland-Jørgensen <toke@redhat.com> writes:
>>
>>> YueHaibing <yuehaibing@huawei.com> writes:
>>>
>>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>>
>>>> drivers/net/wireless/ath/ath9k/recv.c: In function 'ath_rx_count_airtime':
>>>> drivers/net/wireless/ath/ath9k/recv.c:1010:18: warning:
>>>>  variable 'acq' set but not used [-Wunused-but-set-variable]
>>>>
>>>> It's not used after 89cea7493a34 ("ath9k: Switch to mac80211 TXQ scheduling
>>>> and airtime APIs"). Also remove related variables.
>>>
>>> Ah, right, seems I forgot to clean that up. I wonder why I didn't get a
>>> compiler warning for it.
>>
>> I think the warning is not enabled by default and you need to use W=1
>> Makefile variable to enable it.
>
> Hmm, right, thanks! Guess I should get into the habit of compiling with
> warnings enabled before submitting patches :)

But you might get a lot of warnings and it could be difficult to find
new warnings from all the noise. In ath10k I just fixed all W=1 warnings
which I saw with gcc 8.1 and only now I was able to enable W=1 on my
build script.

-- 
Kalle Valo
