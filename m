From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sun, 03 Jan 2016 15:18:11 +0000
Subject: Re: net-libertas: Better exception handling in if_spi_host_to_card_worker()
Message-Id: <CACna6rzoJLRuTTDi3JjXg1roDbk3HXcBhhe0iOUH9xRaGU5p7A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	<5686F0B2.5000000@users.sourceforge.net>
	<56870866.7020000@cogentembedded.com>
	<568785B3.5000905@users.sourceforge.net>
	<alpine.DEB.2.02.1601020914100.2063@localhost6.localdomain6>
	<5687939E.7010701@users.sourceforge.net>
	<5687A2C7.3000704@gmail.com>
	<5687B2BC.8090901@users.sourceforge.net>
	<5688EBAC.5000701@gmail.com>
In-Reply-To: <5688EBAC.5000701@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Arend van Spriel <aspriel@gmail.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Julia Lawall <julia.lawall@lip6.fr>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, libertas-dev@lists.infradead.org, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 3 January 2016 at 10:36, Arend van Spriel <aspriel@gmail.com> wrote:
> On 02-01-16 12:21, SF Markus Elfring wrote:
>>> Did you look at the resulting assembly code for different target archit=
ectures?
>>
>> Not yet. - Which execution system variants would you recommend for
>> further comparisons?
>
> Guess x86{,_64} and arm would be good candidates, ie. CISC vs. RISC.

Oh, don't forget about MIPS with its fancy branches handling. You know
about it, don't you?

I'm against this patch as well.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
