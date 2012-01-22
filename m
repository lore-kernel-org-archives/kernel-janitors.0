From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Sun, 22 Jan 2012 12:17:08 +0000
Subject: Re: busy loops in kernel
Message-Id: <1327234629.10566.82.camel@thorin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
In-Reply-To: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi!

On Mit, 2012-01-18 at 09:48 -0800, Asim wrote:
[....]
> is actually: count, line numbers and C file. In some cases, when
> driver comprises of multiple files, line numbers may be shifted (since
> all files are merged together for analysis).

It's somewhat off-topic, but people are probably more motivated if they
get correct filenames+line numbers of the original source.
Other source munging tools like yacc/bison or lex/flex use "#line" to
get the C compiler to report in errors and warnings the correct
reference to the source.

Kind regards,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

