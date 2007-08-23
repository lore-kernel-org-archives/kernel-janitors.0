From: Paolo Ornati <ornati@fastwebnet.it>
Date: Thu, 23 Aug 2007 07:36:29 +0000
Subject: Re: Ideas on column length in kernel "problem"?
Message-Id: <20070823093629.032f82aa@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
In-Reply-To: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: postfail@hushmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 22 Aug 2007 23:54:41 -0400
"Scott Thompson" <postfail@hushmail.com> wrote:

> if anyone knows of a free/inexpensive mail 
> client that will be able to handle the wordwrap requirements for 
> the current state of the linux tree please advise.

http://www.claws-mail.org/

Configuration -> Preferences -> Wrapping:

"	[x] Auto wrapping
	[ ] Wrap quotation
	[ ] Wrap pasted text

Wrap messages at [..] characters"


Then use the "Insert File" button or (xclip < mypatch.diff && middle
mouse button).

Either will wrap with "Wrap pasted text", so keep it off.


PS: auto wrapping has effect on the text you write directly in the
mailer, you can even turn it off and use "CTRL + L" to wrap the current
paragraph.

-- 
	Paolo Ornati
	Linux 2.6.23-rc3-g2a677896-dirty on x86_64
