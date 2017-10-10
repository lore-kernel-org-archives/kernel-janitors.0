From: David Miller <davem@davemloft.net>
Date: Tue, 10 Oct 2017 19:24:29 +0000
Subject: Re: [PATCH][V2] ipv6: fix incorrect bitwise operator used on rt6i_flags
Message-Id: <20171010.122429.2055747583997527054.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171010181030.22290-1-colin.king@canonical.com>
        <CAC15z3jrkT6K0-FC9QLOmaZQCvEMoDZrABDJ_iGDecTYAksqAw@mail.gmail.com>
In-Reply-To: <CAC15z3jrkT6K0-FC9QLOmaZQCvEMoDZrABDJ_iGDecTYAksqAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tracywwnj@gmail.com
Cc: colin.king@canonical.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Wei Wang <tracywwnj@gmail.com>
Date: Tue, 10 Oct 2017 11:38:20 -0700

> On Tue, Oct 10, 2017 at 11:10 AM, Colin King <colin.king@canonical.com> wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The use of the | operator always leads to true which looks rather
>> suspect to me. Fix this by using & instead to just check the
>> RTF_CACHE entry bit.
>>
>> Detected by CoverityScan, CID#1457734, #1457747 ("Wrong operator used")
>>
>> Fixes: 35732d01fe31 ("ipv6: introduce a hash table to store dst cache")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
> 
> Acked-by: Wei Wang <weiwan@google.com>

Applied, thanks everyone.
