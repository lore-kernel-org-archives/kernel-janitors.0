From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 24 Nov 2008 20:14:02 +0000
Subject: Re: [PATCH] hugetlb: fix sparse warnings
Message-Id: <20081124201402.GA8284@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811241205m293b5824of0fa753c1f8c33a6@mail.gmail.com>
In-Reply-To: <154e089b0811241205m293b5824of0fa753c1f8c33a6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 24.11.2008 [21:05:31 +0100], Hannes Eder wrote:
> Impact: fix sparse warnings
> 
> Fix the following sparse warnings:
> 
>   mm/hugetlb.c:375:3: warning: returning void-valued expression
>   mm/hugetlb.c:408:3: warning: returning void-valued expression
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Acked-by: Nishanth Aravamudan <nacc@us.ibm.com>

Thanks,
Nish
