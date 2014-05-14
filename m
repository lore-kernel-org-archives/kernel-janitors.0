From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Wed, 14 May 2014 14:28:37 +0000
Subject: Re: [Q] Sending a large patch
Message-Id: <1400077717.18277.39.camel@thorin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAAvxhqBUO2HSgZjw=H7=Bd2gdw=JSjAs2Lx8E7rrGw8uqieZAg@mail.gmail.com>
In-Reply-To: <CAAvxhqBUO2HSgZjw=H7=Bd2gdw=JSjAs2Lx8E7rrGw8uqieZAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mit, 2014-05-14 at 15:07 +0100, Masaru Nomura wrote:
> >> Now, I'm cleaning up a file and it has over 100 warnings of line over
> >> 80 character issues. As the problem seems to be the same, I may
> >
> > And you are really sure that is more readable afterwards with the
> > additional line breaks?
> 
> Well, my intention is to follow the coding style[1].

Of course.

> As far as I understand, we follow this for linux-code readability.
> (Of course, I think I shouldn't split/break a line in a bad way though.)
>
> Chap 2 says:
> The limit on the length of lines is 80 columns and this is a strongly
> preferred limit.
>
> Or are there any situations where we ignore over 80 characters?

There are maintainers who do not see it that strict.
(Probably) no one has problem if one reorganizes 130 character lines. 
But if a line with just some printk() has 81 characters if doesn't help
readability/understandability if it is split just for the sake of the
limit.

	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

