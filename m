From: David Miller <davem@davemloft.net>
Date: Wed, 06 Dec 2017 19:25:42 +0000
Subject: Re: [PATCH] bnxt_en: Uninitialized variable in bnxt_tc_parse_actions()
Message-Id: <20171206.142542.491013112912141715.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143752.cymsw7fzlqn6ejeq@mwanda>
        <CACKFLinE9vWuooML4RhZHN0Xo2yr4cB90hEwizdEP3U6DLaoFA@mail.gmail.com>
In-Reply-To: <CACKFLinE9vWuooML4RhZHN0Xo2yr4cB90hEwizdEP3U6DLaoFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: michael.chan@broadcom.com
Cc: dan.carpenter@oracle.com, sathya.perla@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Michael Chan <michael.chan@broadcom.com>
Date: Wed, 6 Dec 2017 11:16:55 -0800

> On Tue, Dec 5, 2017 at 6:37 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> Smatch warns that:
>>
>>     drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:160 bnxt_tc_parse_actions()
>>     error: uninitialized symbol 'rc'.
>>
>> "rc" is either uninitialized or set to zero here so we can just remove
>> the check.
>>
>> Fixes: 8c95f773b4a3 ("bnxt_en: add support for Flower based vxlan encap/decap offload")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks.
> 
> Acked-by: Michael Chan <michael.chan@broadcom.com>

Applied to net-next, thanks everyone.
