From: Fredrik Noring <noring@nocrew.org>
Date: Sun, 06 Jul 2008 18:29:04 +0000
Subject: Re: [PATCH] dsp56k: use request_firmware
Message-Id: <35647D7D-85D1-4308-B3A1-63CDCC3F14F7@nocrew.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1215253496.7816.7.camel@jaswinder.satnam> <A3D470E0-953E-40D6-BF5A-D06B76451154@nocrew.org> <1215357224.2817.2.camel@jaswinder.satnam> <43A34816-3B93-4D05-AE0A-65C0FBF35589@nocrew.org> <1215358732.2817.11.camel@jaswinder.satnam> <1215363247.3189.113.camel@shinybook.infradead.org>
In-Reply-To: <1215363247.3189.113.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Jaswinder Singh <jaswinder@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Lars Brinkhoff <lars@nocrew.org>, =?ISO-8859-1?Q?Tomas_Sk=E4re?= <tomas@nocrew.org>

Hi David,

6 jul 2008 kl. 18.54 skrev David Woodhouse:
> I don't think he has it. That's why he suggested a disassembler.

That's right. Sorry I was unclear. However, after some digging on  
floppy backups from the past, I've found a DSP56k loader routine  
that's probably close if not identical to the assembled version  
included with the kernel. Please see below. A disassembly would verify  
this, but at least it gives you an idea of the inner workings.

All the best,
Fredrik

; DSP56k loader

; Host Interface
M_BCR   EQU     $FFFE           ; Port A Bus Control Register
M_PBC   EQU     $FFE0           ; Port B Control Register
M_PBDDR EQU     $FFE2           ; Port B Data Direction Register
M_PBD   EQU     $FFE4           ; Port B Data Register
M_PCC   EQU     $FFE1           ; Port C Control Register
M_PCDDR EQU     $FFE3           ; Port C Data Direction Register
M_PCD   EQU     $FFE5           ; Port C Data Register

M_HCR   EQU     $FFE8           ; Host Control Register
M_HSR   EQU     $FFE9           ; Host Status Register
M_HRX   EQU     $FFEB           ; Host Receive Data Register
M_HTX   EQU     $FFEB           ; Host Transmit Data Register

; SSI, Synchronous Serial Interface
M_RX    EQU     $FFEF           ; Serial Receive Data Register
M_TX    EQU     $FFEF           ; Serial Transmit Data Register
M_CRA   EQU     $FFEC           ; SSI Control Register A
M_CRB   EQU     $FFED           ; SSI Control Register B
M_SR    EQU     $FFEE           ; SSI Status Register
M_TSR   EQU     $FFEE           ; SSI Time Slot Register

; Exception Processing
M_IPR   EQU     $FFFF           ; Interrupt Priority Register

	org	P:$0
start	jmp	<$40

	org	P:$40
;	; Zero 16384 DSP X and Y words
;	clr	A #0,r0
;	clr	B #0,r4
;	do	#64,<_block1
;	rep	#256
;	move	A,X:(r0)+ B,Y:(r4)+
;_block1	; Zero (32768-512) Program words
;	clr	A #512,r0
;	do	#126,<_block2
;	rep	#256
;	move	A,P:(r0)+
;_block2

	; Copy DSP program control
	move	#real,r0
	move	#upload,r1
	do	#upload_end-upload,<_copy
	move	P:(r0)+,x0
	move	x0,P:(r1)+
_copy	movep	#>4,X:<<M_HCR
	movep	#>$c00,X:<<M_IPR
	and	#<$fe,mr
	jmp	upload

real
	org	P:$7ea9
upload
	movep	#>1,X:<<M_PBC
	movep	#>0,X:<<M_BCR

next	jclr	#0,X:<<M_HSR,*
	movep	X:<<M_HRX,A
	move	#>3,x0
	cmp	x0,A #>1,x0
	jeq	<$0
_get_address
	jclr	#0,X:<<M_HSR,_get_address
	movep	X:<<M_HRX,r0
_get_length
	jclr	#0,X:<<M_HSR,_get_length
	movep	X:<<M_HRX,y0
	cmp	x0,A #>2,x0
	jeq	load_X
	cmp	x0,A
	jeq	load_Y

load_P	do	y0,_load
	jclr	#0,X:<<M_HSR,*
	movep	X:<<M_HRX,P:(r0)+
_load	jmp	next
load_X	do	y0,_load
	jclr	#0,X:<<M_HSR,*
	movep	X:<<M_HRX,X:(r0)+
_load	jmp	next
load_Y	do	y0,_load
	jclr	#0,X:<<M_HSR,*
	movep	X:<<M_HRX,Y:(r0)+
_load	jmp	next

upload_end
	end

