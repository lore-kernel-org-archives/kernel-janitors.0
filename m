From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Wed, 14 May 2014 10:47:32 +0000
Subject: Re: [Q] Sending a large patch
Message-Id: <1400064452.18277.19.camel@thorin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAAvxhqBUO2HSgZjw=H7=Bd2gdw=JSjAs2Lx8E7rrGw8uqieZAg@mail.gmail.com>
In-Reply-To: <CAAvxhqBUO2HSgZjw=H7=Bd2gdw=JSjAs2Lx8E7rrGw8uqieZAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mit, 2014-05-14 at 01:48 +0100, Masaru Nomura wrote:
[...]
> Now, I'm cleaning up a file and it has over 100 warnings of line over
> 80 character issues. As the problem seems to be the same, I may

And you are really sure that is more readable afterwards with the
additional line breaks?

> correct the bugs and send one commit. But I think it's a pain for
> reviewers to check all of them within one patch.

Apart from the questionable usefulness of the above, you should split it
per subsystem/maintainer so that people do not need to look for "their"
parts.
Additionally, the maintainer may take the patch (and you are done) or
reject it (and you are also done;-).

	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

