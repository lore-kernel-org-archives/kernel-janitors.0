From: maowenan <maowenan@huawei.com>
Date: Fri, 20 Dec 2019 02:19:34 +0000
Subject: Re: [PATCH net] af_packet: refactoring code for prb_calc_retire_blk_tmo
Message-Id: <c0944cb6-eb63-b1e6-01da-4cddd2ab7f91@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191219013344.34603-1-maowenan@huawei.com>
 <CA+FuTScgWi905_NhGNsRzpwaQ+OPwahj6NtKgPjLZRjuqJvhXQ@mail.gmail.com>
In-Reply-To: <CA+FuTScgWi905_NhGNsRzpwaQ+OPwahj6NtKgPjLZRjuqJvhXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, maximmi@mellanox.com, Paolo Abeni <pabeni@redhat.com>, yuehaibing@huawei.com, Neil Horman <nhorman@tuxdriver.com>, Network Development <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 2019/12/19 21:56, Willem de Bruijn wrote:
> On Wed, Dec 18, 2019 at 8:37 PM Mao Wenan <maowenan@huawei.com> wrote:
>>
>> If __ethtool_get_link_ksettings() is failed and with
>> non-zero value, prb_calc_retire_blk_tmo() should return
>> DEFAULT_PRB_RETIRE_TOV firstly. Refactoring code and make
>> it more readable.
>>
>> Fixes: b43d1f9f7067 ("af_packet: set defaule value for tmo")
> 
> This is a pure refactor, not a fix.
yes , it is not a fix.
> 
> Code refactors make backporting fixes across releases harder, among
> other things. I think this code is better left as is. Either way, it
> would be a candidate for net-next, not net.
sorry, it would be net-next.
> 
>> -       unsigned int mbits = 0, msec = 0, div = 0, tmo = 0;
>> +       unsigned int mbits = 0, msec = 1, div = 0, tmo = 0;
> 
> Most of these do not need to be initialized here at all, really.
> 
some of them do not need to be initialized,
msec=1 can be reserved because it can indicate tmo is for millisecond and msec
initialized value is 1ms.
