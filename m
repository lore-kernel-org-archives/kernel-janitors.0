From: Geoff Levand <geoff@infradead.org>
Date: Thu, 21 Dec 2017 00:05:33 +0000
Subject: Re: ps3: Improve a size determination in five functions
Message-Id: <d67137c4-5fa7-bb3a-fc38-4d50ceed02cd@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b6464bc-a408-de2a-1b54-cb7794b92506@users.sourceforge.net>
 <7aed1208-aa55-edb6-54be-f47fb1498bfd@users.sourceforge.net>
 <cd0c8519-85d0-0ce5-14a1-54a573234a98@infradead.org>
 <2003adbe-1849-b689-40bf-00e02ae4e01e@users.sourceforge.net>
In-Reply-To: <2003adbe-1849-b689-40bf-00e02ae4e01e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 12/20/2017 01:20 PM, SF Markus Elfring wrote:
>>  o Your patch fixes no bug nor replaces any depreciated feature.
> 
> How do you think about information from the section “14) Allocating memory”
> in the document “coding-style.rst” for the shown source code transformation?

In terms of importance, I would put maintenance and user support as more
important than coding style.

Regarding Section 14 of coding-style.rst specifically, as I mentioned the
PS3 support is over 10 years old.  I don't expect a change to the type of
any structures.  If there are type changes, then we can update the
allocation size parameters at that time.

-Geoff
