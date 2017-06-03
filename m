From: Colin Ian King <colin.king@canonical.com>
Date: Sat, 03 Jun 2017 16:35:22 +0000
Subject: Re: [PATCH] net: stmmac: ensure jumbo_frm error return is correctly checked for -ve value
Message-Id: <40331b09-5829-9041-f815-7f1426960bd8@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170602145827.21151-1-colin.king@canonical.com>
 <CAHp75VeuumsZHDdue=n-2esyG7Q-6472JoYJ64U0+OQoC2psgQ@mail.gmail.com>
In-Reply-To: <CAHp75VeuumsZHDdue=n-2esyG7Q-6472JoYJ64U0+OQoC2psgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 03/06/17 16:55, Andy Shevchenko wrote:
> On Fri, Jun 2, 2017 at 5:58 PM, Colin King <colin.king@canonical.com> wrote:
>> The current comparison of entry < 0 will never be true since entry is an
>> unsigned integer. Cast entry to an int to ensure -ve error return values
>> from the call to jumbo_frm are correctly being caught.
> 
>>         if (unlikely(is_jumbo) && likely(priv->synopsys_id <
>>                                          DWMAC_CORE_4_00)) {
>>                 entry = priv->hw->mode->jumbo_frm(tx_q, skb, csum_insertion);
>> -               if (unlikely(entry < 0))
>> +               if (unlikely((int)entry < 0))
> 
> It feels like a hiding some other issue.
> 

The alternative is:

		int rc = priv->hw->mode->jumbo_frm(tx_q, skb, csum_insertion);
		if (unlikely(rc < 0))
			goto dma_map_err;

		entry = rc;

however, that is effectively the same. The cast I'm using is a well used
idiom in the kernel, it used in almost a hundred similar cases.

git grep "< 0" | grep "(int)" | wc -l
95

Colin
