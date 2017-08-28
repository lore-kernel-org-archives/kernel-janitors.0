From: John Fastabend <john.fastabend@gmail.com>
Date: Mon, 28 Aug 2017 15:58:31 +0000
Subject: Re: [PATCH net-next] bpf: fix oops on allocation failure
Message-Id: <59A43DA7.4070101@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825202714.64ivixeindjph3z6@mwanda> <59A08CCD.2050603@iogearbox.net>
In-Reply-To: <59A08CCD.2050603@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Borkmann <daniel@iogearbox.net>, Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/25/2017 01:47 PM, Daniel Borkmann wrote:
> On 08/25/2017 10:27 PM, Dan Carpenter wrote:
>> "err" is set to zero if bpf_map_area_alloc() fails so it means we return
>> ERR_PTR(0) which is NULL.  The caller, find_and_alloc_map(), is not
>> expecting NULL returns and will oops.
>>
>> Fixes: 174a79ff9515 ("bpf: sockmap with sk redirect support")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Daniel Borkmann <daniel@iogearbox.net>

Thanks.

Acked-by: John Fastabend <john.fastabend@gmail.com>
