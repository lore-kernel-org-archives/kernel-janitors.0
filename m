From: Michal Marek <mmarek@suse.cz>
Date: Wed, 03 Jul 2013 13:55:31 +0000
Subject: Re: [PATCH] scripts: Coccinelle script for pci_free_consistent()
Message-Id: <51D42D53.3000800@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130508230308.Horde.hkDwg5wWGGBzmzKnqIjUhg1@wimap.feld.cvut.cz>
 <CAAxaTiPTtNTpo8DAE628=En=sa0hTzeOJ19DoxE9GwdiQnrUqg@mail.gmail.com>
In-Reply-To: <CAAxaTiPTtNTpo8DAE628=En=sa0hTzeOJ19DoxE9GwdiQnrUqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On 25.6.2013 15:03, Nicolas Palix wrote:
> On Wed, May 8, 2013 at 11:03 PM,  <strnape1@fel.cvut.cz> wrote:
>> Created coccinelle script for reporting missing pci_free_consistent() calls.
>>
>> Signed-off-by: Petr Strnad <strnape1@fel.cvut.cz>
> 
> Signed-off-by: Nicolas Palix <nicolas.palix@imag.fr>

Applied to kbuild.git#misc. BTW, the patch was malformed at several
places, you mailer broke long lines like this:

>> +msg = "ERROR: missing pci_free_consistent; pci_alloc_consistent on line %s
>> and return without freeing on line %s" % (p1[0].line,p2[0].line)

Please send the patch to yourself next time and verify that 'git am' can
apply it, before sending it to the mailing list.

Thanks,
Michal
