From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 19 Jan 2004 23:08:06 +0000
Subject: Re: [Kernel-janitors] [announce] new KJ web hosting
Message-Id: <20040119150806.3550e6de.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040111193612.2b4445fc.rddunlap@osdl.org>
In-Reply-To: <20040111193612.2b4445fc.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 19 Jan 2004 21:57:49 +0100 maximilian attems <janitor@sternwelten.at> wrote:

| hey randy,
| 
| just run the new page through the validator:
| http://validator.w3.org/check?uri=http%3A%2F%2Fjanitor.kernelnewbies.org%2F
| uuups
| the html is far from being valid.
| 
| belows 2 patches make the webpage valid,
| * adds document declaration 4.01 strict
| * removes unused body css class
| * removes center tags
| * adds alt tag for pinguin
| * adds 2 div containers for centred tables
|   => replacement of invalid <table align="middle">
| * adds extern <tr> to <th> tags
| * extra minor stuff
| 
| the html patch tries to be minimal
| it leaves table even if they shouldn't be used for layout.
| and doesn't switch to newer xhtml. 
| 
| please do not forget to apply the css patch
| without it the text of the homepage would be invisible
| 
| tested on mozilla-firebird 0.7, mozilla 1.5, lynx 2.8.4rel.1
| and netscape 4.77 (it didn't crash ;)
| hope you like it?

Applied, and thanks.

--
~Randy
Everything is relative.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
