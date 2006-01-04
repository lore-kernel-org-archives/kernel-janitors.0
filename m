From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Wed, 04 Jan 2006 16:46:54 +0000
Subject: Re: [KJ] [PATCH] drivers/block: Use ARRAY_SIZE macro
Message-Id: <9a8748490601040846w181f8befq11cec9e2c0655d9c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060104160526.GA1243@neon.tklauser.home>
In-Reply-To: <20060104160526.GA1243@neon.tklauser.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/4/06, Tobias Klauser <tklauser@nuerscht.ch> wrote:
> Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove a
> duplicate of ARRAY_SIZE. Some trailing whitespaces are also removed.
>
> drivers/block/acsi* has been left out as it's marked BROKEN.
>

And if noone ever improves on it it'll probably stay BROKEN.  Might as
well fix it up now that you've done the other files :)


The patch looked good to me btw.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
