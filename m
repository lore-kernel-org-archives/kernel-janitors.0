From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 24 Aug 2007 11:07:54 +0000
Subject: Re: Ideas on column length in kernel "problem"?
Message-Id: <9a8748490708240407pf1fa935j2dae3b0c108b3231@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_157465_32986189.1187953674736"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
	 <200708241231.52767.lists-receive@programmierforen.de>
	 <20070824114611.7b17cafd@the-village.bc.nu>
In-Reply-To: <20070824114611.7b17cafd@the-village.bc.nu>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Andi Drebes <lists-receive@programmierforen.de>, postfail@hushmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

------=_Part_157465_32986189.1187953674736
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 24/08/07, Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> > I think this is also a matter of conding style. Documentation/CodingStyle
> > says:
> >
> > "The limit on the length of lines is 80 columns and this is a hard limit."
>
> As has repeatedly been stated this is a bug in Documentation/CodingStyle
> and bears no resemblence to reality.
>
So let's update CodingStyle once and for all so that doesn't pop up
again. See attached patch (inline version is whitespace damaged -
can't help it from my current location).


As continuously gets pointed out, the 80 col line length defined in CodingStyle
is not a hard limit in real life. Let the document reflect reality.

Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

--- Documentation/CodingStyle~  2007-08-24 13:04:20.000000000 +0200
+++ Documentation/CodingStyle   2007-08-24 13:04:20.000000000 +0200
@@ -77,7 +77,8 @@
 Coding style is all about readability and maintainability using commonly
 available tools.

-The limit on the length of lines is 80 columns and this is a hard limit.
+The limit on the length of lines is 80 columns. This is a soft limit, it can
+be broken in some cases, but you should respect it whenever possible.

 Statements longer than 80 columns will be broken into sensible chunks.
 Descendants are always substantially shorter than the parent and are placed



-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

------=_Part_157465_32986189.1187953674736
Content-Type: application/octet-stream; name=line-length.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f5qkvwvo
Content-Disposition: attachment; filename="line-length.patch"

CkFzIGNvbnRpbnVvdXNseSBnZXRzIHBvaW50ZWQgb3V0LCB0aGUgODAgY29sIGxpbmUgbGVuZ3Ro
IGRlZmluZWQgaW4gQ29kaW5nU3R5bGUKaXMgbm90IGEgaGFyZCBsaW1pdCBpbiByZWFsIGxpZmUu
IExldCB0aGUgZG9jdW1lbnQgcmVmbGVjdCByZWFsaXR5LgoKU2lnbmVkLW9mZi1ieTogSmVzcGVy
IEp1aGwgPGplc3Blci5qdWhsQGdtYWlsLmNvbT4KLS0tCgotLS0gRG9jdW1lbnRhdGlvbi9Db2Rp
bmdTdHlsZX4JMjAwNy0wOC0yNCAxMzowNDoyMC4wMDAwMDAwMDAgKzAyMDAKKysrIERvY3VtZW50
YXRpb24vQ29kaW5nU3R5bGUJMjAwNy0wOC0yNCAxMzowNDoyMC4wMDAwMDAwMDAgKzAyMDAKQEAg
LTc3LDcgKzc3LDggQEAKIENvZGluZyBzdHlsZSBpcyBhbGwgYWJvdXQgcmVhZGFiaWxpdHkgYW5k
IG1haW50YWluYWJpbGl0eSB1c2luZyBjb21tb25seQogYXZhaWxhYmxlIHRvb2xzLgogCi1UaGUg
bGltaXQgb24gdGhlIGxlbmd0aCBvZiBsaW5lcyBpcyA4MCBjb2x1bW5zIGFuZCB0aGlzIGlzIGEg
aGFyZCBsaW1pdC4KK1RoZSBsaW1pdCBvbiB0aGUgbGVuZ3RoIG9mIGxpbmVzIGlzIDgwIGNvbHVt
bnMuIFRoaXMgaXMgYSBzb2Z0IGxpbWl0LCBpdCBjYW4KK2JlIGJyb2tlbiBpbiBzb21lIGNhc2Vz
LCBidXQgeW91IHNob3VsZCByZXNwZWN0IGl0IHdoZW5ldmVyIHBvc3NpYmxlLgogCiBTdGF0ZW1l
bnRzIGxvbmdlciB0aGFuIDgwIGNvbHVtbnMgd2lsbCBiZSBicm9rZW4gaW50byBzZW5zaWJsZSBj
aHVua3MuCiBEZXNjZW5kYW50cyBhcmUgYWx3YXlzIHN1YnN0YW50aWFsbHkgc2hvcnRlciB0aGFu
IHRoZSBwYXJlbnQgYW5kIGFyZSBwbGFjZWQK
------=_Part_157465_32986189.1187953674736--
