From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 13:50:12 +0000
Subject: Re: [3/3] GenWQE: Adjust 12 checks for null pointers
Message-Id: <15ccaf5d-3601-e895-900b-078fbca148d6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e1b73b1a-ae0a-b76b-33d7-4dc5af8e39b5@users.sourceforge.net>
 <49115f17-73f9-de03-d0cd-7a76c3c43dcc@users.sourceforge.net>
 <f0998daeca45411ab0b161464ac2931d@linux.vnet.ibm.com>
In-Reply-To: <f0998daeca45411ab0b161464ac2931d@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1254"
Content-Transfer-Encoding: base64
To: Frank Haverkamp <haver@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?J=c3=b6rg-Stephan_Vogt?= <jsvogt@de.ibm.com>, =?UTF-8?Q?Michael_R=c3=bcttger?= <michael@ibmra.de>

PiBJIHBlcnNvbmFsbHkgbGlrZSB0aGUgZXhwbGljaXQgY29tcGFyZSAocHRyICE9IE5VTEwpIG1v
cmUgdGhhbiB0aGUgIXB0ciBub3RhdGlvbi4KCkNvZGluZyBzdHlsZSBhc3BlY3RzIGNhbiBldm9s
dmUsIGNhbid0IHRoZXk/CgoKPiBXaGVuIHdhcyB0aGUgY2hlY2twYXRjaC5wbCBzY3JpcHQgbW9k
aWZpZWQgdG8gc3VnZ2VzdCB0aGUgbGF0dGVyIG5vdGF0aW9uPwoKV291bGQgeW91IGxpa2UgdG8g
dGFrZSBhbm90aGVyIGxvb2sgYXQgdGhlIHNvZnR3YXJlIHVwZGF0ZSDigJxjaGVja3BhdGNoOiBh
ZGQKLS1zdHJpY3QgInBvaW50ZXIgY29tcGFyaXNvbiB0byBOVUxMIiB0ZXN04oCdIGZyb20gMjAx
NC0xMi0xMD8KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWS3NWFjNjE4ZGY3NTFiOTI3NDY5ZGRiY2E2M2Nm
MTUxYTYyZjBmOWQKCgo+IElzIHRoZXJlIGFueSBhZHZhbnRhZ2Ugb3RoZXIgdGhhbiB0aGUgc2hv
cnRlciBub3RhdGlvbj8KCiogRG8geW91IGV2ZW50dWFsbHkgY2FyZSBmb3IgYW4gaW5mbHVlbmNl
IG9uIHRoZSBydW4gdGltZSBjaGFyYWN0ZXJpc3RpY3MKICBmb3IgdGhlIGNvbXBpbGF0aW9uIG9m
IHRoaXMgc29mdHdhcmUgbW9kdWxlPwoKKiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIHJlZHVj
ZSB0aGUgZGVwZW5kZW5jeSBvbiBhIHNwZWNpYWwgcHJlcHJvY2Vzc29yIHN5bWJvbD8KClJlZ2Fy
ZHMsCk1hcmt1cwotLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGlu
ZSAidW5zdWJzY3JpYmUga2VybmVsLWphbml0b3JzIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2Ug
dG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRw
Oi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWw=
