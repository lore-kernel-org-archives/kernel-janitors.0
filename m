From: Michal Marek <mmarek@suse.com>
Date: Fri, 19 Feb 2016 13:09:44 +0000
Subject: Re: [PATCH] scripts/coccinelle: modernize &
Message-Id: <56C71418.1020904@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1455750974-24339-1-git-send-email-Julia.Lawall@lip6.fr>
 <56C50699.6000007@ti.com>
In-Reply-To: <56C50699.6000007@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On 2016-02-18 00:47, Nishanth Menon wrote:
> On 02/17/2016 05:16 PM, Julia Lawall wrote:
>> & is no longer allowed in column 0, since Coccinelle 1.0.4.
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
[...]
> Verified with:
> spatch --version
> spatch byte-code version 1.0.4-00118-gc7cf750d1c44 compiled with OCaml
> version 4.01.0
> 
> 
> Tested-by: Nishanth Menon <nm@ti.com>

Applied to kbuild.git#misc with Cc: stable.

Michal
