From: Michal Marek <mmarek@suse.cz>
Date: Sat, 14 Jan 2012 21:56:14 +0000
Subject: Re: [PATCH] scripts/coccinelle: improve the coverage of some semantic patches
Message-Id: <4F11F9FE.7070400@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326562543-8448-1-git-send-email-Julia.Lawall@lip6.fr>  <1326577096.2172.2.camel@koala> <1326577949.2172.5.camel@koala>
In-Reply-To: <1326577949.2172.5.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dedekind1@gmail.com
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org

On 14.1.2012 22:52, Artem Bityutskiy wrote:
> On Sat, 2012-01-14 at 23:38 +0200, Artem Bityutskiy wrote:
>> On Sat, 2012-01-14 at 18:35 +0100, Julia Lawall wrote:
>>> From: Julia Lawall <Julia.Lawall@lip6.fr>
>>>
>>> This patch ensures that all semantic patches in the scripts/coccinelle
>>> directory provide the report option.  Report messages that include line
>>> numbers now have the line number preceded by "line" for easier subsequent
>>> processing.
>>>
>>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>>
>> Julia, thanks a lot for this harmonization effort!
>>
>> I did not do detailed review, but looks good.
>>
>> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Adding Michal to "To:", since you apparently merge via his tree. Michal,
> would you please pick this one as well?

Yes. My .procmail catched this thread, but thanks for adding me
nevertheless :-).

Michal
