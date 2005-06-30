From: Daniel Smertnig <daniel.smertnig@gmail.com>
Date: Thu, 30 Jun 2005 17:23:03 +0000
Subject: Re: [KJ] [PATCH 2.6.12] [RESEND] /proc/tty/driver/* filtering for non
Message-Id: <18dd01ff0506301023581734db@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622194756.GA6699@dansme-mobile.smertnig>
In-Reply-To: <20050622194756.GA6699@dansme-mobile.smertnig>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/30/05, Domen Puncer <domen@coderock.org> wrote:
> On 30/06/05 15:56 +0200, Daniel Smertnig wrote:
> > Hmm, that would work to, but strcat() always appends to the end of the
> > string anyway. But if buf+ret is clearer to you I can change it. Shall
> > I?
> 
> Ah, dammit, that's what I was missing. Somehow I was reading "strcpy".
> 
> It's fine the way it is; sorry for the noise.

oh, sorry for the confusion :-)

thanks,
daniel

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
