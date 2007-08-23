From: walter harms <wharms@bfs.de>
Date: Thu, 23 Aug 2007 11:56:48 +0000
Subject: Re: Ideas on column length in kernel "problem"?
Message-Id: <46CD7600.6020608@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com> <20070823093629.032f82aa@localhost>
In-Reply-To: <20070823093629.032f82aa@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Ornati <ornati@fastwebnet.it>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Paolo Ornati wrote:
> On Wed, 22 Aug 2007 23:54:41 -0400
> "Scott Thompson" <postfail@hushmail.com> wrote:
> 
>> if anyone knows of a free/inexpensive mail 
>> client that will be able to handle the wordwrap requirements for 
>> the current state of the linux tree please advise.
> 
> http://www.claws-mail.org/
> 
> Configuration -> Preferences -> Wrapping:
> 
> "	[x] Auto wrapping
> 	[ ] Wrap quotation
> 	[ ] Wrap pasted text
> 
> Wrap messages at [..] characters"
> 
> 
> Then use the "Insert File" button or (xclip < mypatch.diff && middle
> mouse button).

xclip converts tabs to space if i remember correctly

re,
 wh




> Either will wrap with "Wrap pasted text", so keep it off.
> 
> 
> PS: auto wrapping has effect on the text you write directly in the
> mailer, you can even turn it off and use "CTRL + L" to wrap the current
> paragraph.
> 
