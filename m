From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 09 May 2019 14:29:42 +0000
Subject: Re: [PATCH] EDAC, sb_edac: remove redundant update of tad_base
Message-Id: <55f8efee-a02c-1574-42fa-35e1d3df14f7@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508224201.27120-1-colin.king@canonical.com>
 <20190509141313.GA17053@zn.tnic>
In-Reply-To: <20190509141313.GA17053@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/05/2019 15:13, Borislav Petkov wrote:
> On Wed, May 08, 2019 at 11:42:01PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The variable tad_base is being set to a value that is never read
>> and is being over-written on the next iteration of a for-loop.
>> This assignment is therefore redundant and can be removed.
>>
>> Addresses-Coverity: ("Unused value")
> 
> What's that tag's function supposed to be?

These are the Coverity static analysis warning/error message
classifications.  Tagging them should be useful for several reasons:

1. We can classify the types of issues being fixed
2. We can see how many issues are being found/fixed with the use of
static analysis tools like Coverity
3. It provides some context on how these bugs were being found.

I hope that helps.

> 
> I see a lot of those in commit messages but it is nowhere documented in
> the tree.
> 
> $ git grep -i coverity
> 
> doesn't give anything relevant.
> 
> Hmm?
> 
