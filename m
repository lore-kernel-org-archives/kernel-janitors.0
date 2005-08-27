From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 27 Aug 2005 21:30:36 +0000
Subject: [KJ] [PATCH] rio: bring prototypes to the new century
Message-Id: <20050827213036.GA481@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33421825886130785=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33421825886130785==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/char/rio/rioboot.c  |   25 ++------------
 drivers/char/rio/rioctrl.c  |   12 +-----
 drivers/char/rio/rioinit.c  |   78 ++++++++++----------------------------------
 drivers/char/rio/riointr.c  |   18 ++--------
 drivers/char/rio/rioparam.c |   24 +++----------
 drivers/char/rio/rioroute.c |   35 ++++---------------
 drivers/char/rio/riotable.c |   19 ++--------
 drivers/char/rio/riotty.c   |   14 +------
 8 files changed, 51 insertions(+), 174 deletions(-)

--- linux-rio-000/drivers/char/rio/rioboot.c
+++ linux-rio-001/drivers/char/rio/rioboot.c
@@ -107,9 +107,7 @@ RIOAtVec2Ctrl[] =
 ** Load in the RTA boot code.
 */
 int
-RIOBootCodeRTA(p, rbp)
-struct rio_info *	p;
-struct DownLoad *	rbp; 
+RIOBootCodeRTA(struct rio_info *p, struct DownLoad *rbp)
 {
 	int offset;
 
@@ -240,9 +238,7 @@ void rio_start_card_running (struct Host
 ** numbers have trouble understanding what they are doing here.
 */
 int
-RIOBootCodeHOST(p, rbp)
-struct rio_info *	p;
-register struct DownLoad *rbp;
+RIOBootCodeHOST(struct rio_info *p, struct DownLoad *rbp)
 {
 	register struct Host *HostP;
 	register caddr_t Cad;
@@ -654,11 +650,7 @@ register struct DownLoad *rbp;
 ** return 1. If we havent, then return 0.
 */
 int
-RIOBootRup( p, Rup, HostP, PacketP)
-struct rio_info *	p;
-uint Rup;
-struct Host *HostP;
-struct PKT *PacketP; 
+RIOBootRup(struct rio_info *p, uint Rup, struct Host *HostP, struct PKT *PacketP)
 {
 	struct PktCmd *PktCmdP = (struct PktCmd *)PacketP->data;
 	struct PktCmd_M *PktReplyP;
@@ -1239,10 +1231,7 @@ static int RIOBootComplete( struct rio_i
 ** "boot/noboot" field in the rio.cf file.
 */
 int
-RIOBootOk(p, HostP, RtaUniq)
-struct rio_info *	p;
-struct Host *		HostP;
-ulong RtaUniq;
+RIOBootOk(struct rio_info *p, struct Host *HostP, ulong RtaUniq)
 {
     int		Entry;
     uint HostUniq = HostP->UniqueNum;
@@ -1268,11 +1257,7 @@ ulong RtaUniq;
 */
 
 void
-FillSlot(entry, entry2, RtaUniq, HostP)
-int entry;
-int entry2;
-uint RtaUniq;
-struct Host *HostP;
+FillSlot(int entry, int entry2, uint RtaUniq, struct Host *HostP)
 {
 	int		link;
 
--- linux-rio-000/drivers/char/rio/rioctrl.c
+++ linux-rio-001/drivers/char/rio/rioctrl.c
@@ -151,12 +151,7 @@ static int copyout (caddr_t dp, int arg,
 }
 
 int
-riocontrol(p, dev, cmd, arg, su)
-struct rio_info	* p;
-dev_t		dev;
-int		cmd;
-caddr_t		arg;
-int		su;
+riocontrol(struct rio_info *p, dev_t dev, int cmd, caddr_t arg, int su)
 {
 	uint	Host;	/* leave me unsigned! */
 	uint	port;	/* and me! */
@@ -1754,10 +1749,7 @@ RIO_DEBUG_CTRL, 				if (su)
 ** Pre-emptive commands go on RUPs and are only one byte long.
 */
 int
-RIOPreemptiveCmd(p, PortP, Cmd)
-struct rio_info *	p;
-struct Port *PortP;
-uchar Cmd;
+RIOPreemptiveCmd(struct rio_info *p, struct Port *PortP, uchar Cmd)
 {
 	struct CmdBlk *CmdBlkP;
 	struct PktCmd_M *PktCmdP;
--- linux-rio-000/drivers/char/rio/rioinit.c
+++ linux-rio-001/drivers/char/rio/rioinit.c
@@ -102,9 +102,7 @@ extern int	rio_intr();
 **	Init time code.
 */
 void
-rioinit( p, info )
-struct rio_info		* p;
-struct RioHostInfo	* info;
+rioinit(struct rio_info *p, struct RioHostInfo *info)
 {
 	/*
 	** Multi-Host card support - taking the easy way out - sorry !
@@ -130,9 +128,7 @@ struct RioHostInfo	* info;
 ** Initialise the Cards 
 */ 
 void
-RIOInitHosts(p, info)
-struct rio_info		* p;
-struct RioHostInfo	* info;
+RIOInitHosts(struct rio_info *p, struct RioHostInfo *info)
 {
 /*
 ** 15.10.1998 ARG - ESIL 0762 part fix
@@ -188,9 +184,7 @@ struct RioHostInfo	* info;
 ** structure and initialise
 */
 void
-RIOISAinit(p, mode)
-struct rio_info *	p;
-int					mode;
+RIOISAinit(struct rio_info *p, int mode)
 {
 
   /* XXX Need to implement this. */
@@ -219,10 +213,7 @@ int					mode;
 ** in the Rio Hosts structure.
 */
 int
-RIODoAT(p, Base, mode)
-struct rio_info *	p;
-int		Base;
-int		mode;
+RIODoAT(struct rio_info *p, int Base, int mode)
 {
 #define	FOUND		1
 #define NOT_FOUND	0
@@ -250,8 +241,7 @@ int		mode;
 }
 
 caddr_t
-RIOCheckForATCard(Base)
-int		Base;
+RIOCheckForATCard(int Base)
 {
 	int				off;
 	struct DpRam	*cardp;		/* (Points at the host) */
@@ -314,11 +304,7 @@ int		Base;
 ** bits > 0 indicates 16 bit operation.
 */
 int
-RIOAssignAT(p, Base, virtAddr, mode)
-struct rio_info *	p;
-int		Base;
-caddr_t	virtAddr;
-int		mode;
+RIOAssignAT(struct rio_info *p, int Base, caddr_t virtAddr, int mode)
 {
 	int		bits;
 	struct DpRam *cardp = (struct DpRam *)virtAddr;
@@ -901,9 +887,7 @@ write_config(int bus_number, int device_
 #endif
 
 int
-RIOPCIinit(p, Mode)
-struct rio_info	*p;
-int 		Mode;
+RIOPCIinit(struct rio_info *p, int Mode)
 {
 	#define MAX_PCI_SLOT		32
 	#define RIO_PCI_JET_CARD	0x200011CB
@@ -1043,11 +1027,7 @@ static	uchar	val[] = {
 ** Nothing too complicated, just enough to check it out.
 */
 int
-RIOBoardTest(paddr, caddr, type, slot)
-paddr_t	paddr;
-caddr_t	caddr;
-uchar	type;
-int		slot;
+RIOBoardTest(paddr_t paddr, caddr_t caddr, uchar type, int slot)
 {
 	struct DpRam *DpRam = (struct DpRam *)caddr;
 	char *ram[4];
@@ -1124,10 +1104,7 @@ int		slot;
 ** to check that the data from the previous phase was retained.
 */
 static int
-RIOScrub(op, ram, size)
-int		op;
-BYTE *	ram;
-int		size; 
+RIOScrub(int op, BYTE *ram, int size)
 {
 	int				off;
 	unsigned char	oldbyte;
@@ -1271,8 +1248,7 @@ int		size; 
 */
 #if 0
 static void
-RIOAllocateInterrupts(p)
-struct rio_info *	p;
+RIOAllocateInterrupts(struct rio_info *p)
 {
 	int Host;
 
@@ -1310,10 +1286,7 @@ struct rio_info *	p;
 ** poll.
 */
 static void
-RIOStopInterrupts(p, Reason, Host)
-struct rio_info *	p;
-int	Reason;
-int	Host; 
+RIOStopInterrupts(struct rio_info *p, int Reason, int Host)
 {
 #ifdef FUTURE_RELEASE
 	switch (Reason) {
@@ -1372,8 +1345,7 @@ int	Host; 
 ** This function is called at init time to setup the data structures.
 */
 void
-RIOAllocDataStructs(p)
-struct rio_info *	p;
+RIOAllocDataStructs(struct rio_info *p)
 {
 	int	port,
 		host,
@@ -1430,8 +1402,7 @@ struct rio_info *	p;
 ** re-setup, for example, after a riohalt (why did I ever invent it?)
 */
 void
-RIOSetupDataStructs(p)
-struct rio_info	* p;
+RIOSetupDataStructs(struct rio_info *p)
 {
 	int host, entry, rup;
 
@@ -1458,10 +1429,7 @@ struct rio_info	* p;
 #endif
 
 int
-RIODefaultName(p, HostP, UnitId)
-struct rio_info *	p;
-struct Host *	HostP;
-uint			UnitId;
+RIODefaultName(struct rio_info *p, struct Host *HostP, uint UnitId)
 {
 #ifdef CHECK
 	CheckHost( Host );
@@ -1485,8 +1453,7 @@ uint			UnitId;
 
 #if 0
 static int
-RIOReport(p)
-struct rio_info *	p;
+RIOReport(struct rio_info *p)
 {
 	char *	RIORelease = RIO_RELEASE;
 	char *	RIORelID = RELEASE_ID;
@@ -1525,30 +1492,21 @@ RIOVersid(void)
 
 #if 0
 int
-RIOMapin(paddr, size, vaddr)
-paddr_t		paddr;
-int			size;
-caddr_t *	vaddr;
+RIOMapin(paddr_t paddr, int size, caddr_t *vaddr)
 {
 	*vaddr = (caddr_t)permap( (long)paddr, size);
 	return ((int)*vaddr);
 }
 
 void
-RIOMapout(paddr, size, vaddr)
-paddr_t		paddr;
-long		size;
-caddr_t 	vaddr;
+RIOMapout(paddr_t paddr, long size, caddr_t vaddr)
 {
 }
 #endif
 
 
 void
-RIOHostReset(Type, DpRamP, Slot)
-uint Type;
-volatile struct DpRam *DpRamP;
-uint Slot; 
+RIOHostReset(uint Type, volatile struct DpRam *DpRamP, uint Slot)
 {
 	/*
 	** Reset the Tpu
--- linux-rio-000/drivers/char/rio/riointr.c
+++ linux-rio-001/drivers/char/rio/riointr.c
@@ -101,8 +101,7 @@ static char *firstchars (char *p, int nc
 #define	INCR( P, I )	((P) = (((P)+(I)) & p->RIOBufferMask))
 /* Enable and start the transmission of packets */
 void
-RIOTxEnable(en)
-char *		en;
+RIOTxEnable(char *en)
 {
   struct Port *	PortP;
   struct rio_info *p;
@@ -192,10 +191,7 @@ static int	RupIntr;
 static int	RxIntr;
 static int	TxIntr;
 void
-RIOServiceHost(p, HostP, From)
-struct rio_info *	p;
-struct Host *HostP;
-int From; 
+RIOServiceHost(struct rio_info *p, struct Host *HostP, int From)
 {
   rio_spin_lock (&HostP->HostLock);
   if ( (HostP->Flags & RUN_STATE) != RC_RUNNING ) { 
@@ -551,9 +547,7 @@ int From; 
 ** we return the ttySpl level that we re-locked at.
 */
 static void
-RIOReceive(p, PortP)
-struct rio_info *	p;
-struct Port *		PortP;
+RIOReceive(struct rio_info *p, struct Port *PortP)
 {
   struct tty_struct *TtyP;
   register ushort transCount;
@@ -732,11 +726,7 @@ struct Port *		PortP;
 ** The proc routine works hand in hand with the interrupt routine.
 */
 int
-riotproc(p, tp, cmd, port)
-struct rio_info *	p;
-register struct ttystatics *tp;
-int cmd;
-int	port;
+riotproc(struct rio_info *p, struct ttystatics *tp, int cmd, int port)
 {
 	register struct Port *PortP;
 	int SysPort;
--- linux-rio-000/drivers/char/rio/rioparam.c
+++ linux-rio-001/drivers/char/rio/rioparam.c
@@ -158,11 +158,7 @@ static char *_rioparam_c_sccs_ = "@(#)ri
 **	tty lock must NOT have been previously acquired.
 */
 int
-RIOParam(PortP, cmd, Modem, SleepFlag)
-struct Port *PortP;
-int cmd;
-int Modem;
-int SleepFlag; 
+RIOParam(struct Port *PortP, int cmd, int Modem, int SleepFlag)
 {
 	register struct tty_struct *TtyP;
 	int	retval;
@@ -639,9 +635,7 @@ int SleepFlag; 
 ** to by the TxAdd pointer has PKT_IN_USE clear in its address.
 */
 int
-can_add_transmit(PktP, PortP)
-PKT **PktP;
-struct Port *PortP; 
+can_add_transmit(PKT **PktP, struct Port *PortP)
 {
 	register PKT *tp;
 
@@ -656,8 +650,7 @@ struct Port *PortP; 
 ** packet pointer. You must wrap the pointer from the end back to the start.
 */
 void
-add_transmit(PortP)
-struct Port *PortP; 
+add_transmit(struct Port *PortP)
 {
   if (RWORD(*PortP->TxAdd) & PKT_IN_USE) {
     rio_dprintk (RIO_DEBUG_PARAM, "add_transmit: Packet has been stolen!");
@@ -673,9 +666,7 @@ struct Port *PortP; 
  * free list
  ****************************************/
 void
-put_free_end(HostP, PktP)
-struct Host *HostP;
-PKT *PktP;
+put_free_end(struct Host *HostP, PKT *PktP)
 {
 	FREE_LIST *tmp_pointer;
 	ushort old_end, new_end;
@@ -716,9 +707,7 @@ PKT *PktP;
 ** then can_remove_receive() returns 0.
 */
 int
-can_remove_receive(PktP, PortP)
-PKT **PktP;
-struct Port *PortP;
+can_remove_receive(PKT **PktP, struct Port *PortP)
 {
 	if ( RWORD(*PortP->RxRemove) & PKT_IN_USE) {
 		*PktP = (PKT *)RIO_PTR(PortP->Caddr,
@@ -734,8 +723,7 @@ struct Port *PortP;
 ** be wrapped back to the start.
 */
 void
-remove_receive(PortP)
-struct Port *PortP; 
+remove_receive(struct Port *PortP)
 {
 	WWORD( *PortP->RxRemove, RWORD(*PortP->RxRemove) & ~PKT_IN_USE );
 	PortP->RxRemove = (PortP->RxRemove == PortP->RxEnd) ? PortP->RxStart : 
--- linux-rio-000/drivers/char/rio/rioroute.c
+++ linux-rio-001/drivers/char/rio/rioroute.c
@@ -622,10 +622,7 @@ int RIORouteRup( struct rio_info *p, uin
 
 
 void
-RIOFixPhbs(p, HostP, unit)
-struct rio_info *p;
-struct Host *HostP;
-uint unit;
+RIOFixPhbs(struct rio_info *p, struct Host *HostP, uint unit)
 {
 	ushort			link, port;
 	struct Port		*PortP;
@@ -724,10 +721,7 @@ uint unit;
 ** only gets up-to-date information about what is going on.
 */
 static int
-RIOCheckIsolated(p, HostP, UnitId)
-struct rio_info *	p;
-struct Host *HostP;
-uint UnitId;
+RIOCheckIsolated(struct rio_info *p, struct Host *HostP, uint UnitId)
 {
 	unsigned long flags;
 	rio_spin_lock_irqsave(&HostP->HostLock, flags);
@@ -754,10 +748,7 @@ uint UnitId;
 ** subnet will re-introduce itself.
 */
 static int
-RIOIsolate(p, HostP, UnitId)
-struct rio_info *	p;
-struct Host *		HostP;
-uint UnitId; 
+RIOIsolate(struct rio_info *p, struct Host *HostP, uint UnitId)
 {
 	uint link, unit;
 
@@ -789,9 +780,7 @@ uint UnitId; 
 }
 
 static int
-RIOCheck(HostP, UnitId)
-struct Host *HostP;
-uint UnitId;
+RIOCheck(struct Host *HostP, uint UnitId)
 {
   unsigned char link;
 
@@ -850,8 +839,7 @@ uint UnitId;
 */
 
 uint
-GetUnitType(Uniq)
-uint Uniq;
+GetUnitType(uint Uniq)
 {
 	switch ( (Uniq >> 28) & 0xf)
 	{
@@ -874,8 +862,7 @@ uint Uniq;
 }
 
 int
-RIOSetChange(p)
-struct rio_info *	p;
+RIOSetChange(struct rio_info *p)
 {
 	if ( p->RIOQuickCheck != NOT_CHANGED )
 		return(0);
@@ -890,14 +877,8 @@ struct rio_info *	p;
 }
 
 static void
-RIOConCon(p, HostP, FromId, FromLink, ToId, ToLink, Change)
-struct rio_info *	p;
-struct Host *HostP;
-uint FromId;
-uint FromLink;
-uint ToId;
-uint ToLink;
-int Change; 
+RIOConCon(struct rio_info *p, struct Host *HostP, uint FromId, uint FromLink,
+	  uint ToId, uint ToLink, int Change)
 {
     char *FromName;
     char *FromType;
--- linux-rio-000/drivers/char/rio/riotable.c
+++ linux-rio-001/drivers/char/rio/riotable.c
@@ -92,8 +92,7 @@ static char *_riotable_c_sccs_ = "@(#)ri
 ** to sort it out and use the information contained therein.
 */
 int
-RIONewTable(p)
-struct rio_info *	p;
+RIONewTable(struct rio_info *p)
 {
 	int Host, Host1, Host2, NameIsUnique, Entry, SubEnt;
 	struct Map *MapP;
@@ -435,8 +434,7 @@ struct rio_info *	p;
 ** principles.
 */
 int
-RIOApel(p)
-struct rio_info *	p;
+RIOApel(struct rio_info *p)
 {
 	int Host;
 	int link;
@@ -490,9 +488,7 @@ struct rio_info *	p;
 ** it from the table.
 */
 int
-RIODeleteRta(p, MapP)
-struct rio_info *p;
-struct Map *MapP;
+RIODeleteRta(struct rio_info *p, struct Map *MapP)
 {
 	int host, entry, port, link;
 	int SysPort;
@@ -806,10 +802,7 @@ int RIOAssignRta( struct rio_info *p, st
 
 
 int
-RIOReMapPorts(p, HostP, HostMapP)
-struct rio_info *	p;
-struct Host *HostP;
-struct Map *HostMapP; 
+RIOReMapPorts(struct rio_info *p, struct Host *HostP, struct Map *HostMapP)
 {
 	register struct Port *PortP;
 	uint SubEnt;
@@ -987,9 +980,7 @@ struct Map *HostMapP; 
 }
 
 int
-RIOChangeName(p, MapP)
-struct rio_info *p;
-struct Map* MapP; 
+RIOChangeName(struct rio_info *p, struct Map* MapP)
 {
 	int host;
 	struct Map *HostMapP;
--- linux-rio-000/drivers/char/rio/riotty.c
+++ linux-rio-001/drivers/char/rio/riotty.c
@@ -762,8 +762,7 @@ RIOCookMode(struct ttystatics *tp)
 #endif
 
 static void
-RIOClearUp(PortP)
-struct Port *PortP;
+RIOClearUp(struct Port *PortP)
 {
 	rio_dprintk (RIO_DEBUG_TTY, "RIOHalted set\n");
 	PortP->Config = 0;	  /* Direct semaphore */
@@ -1281,10 +1280,7 @@ riotioctl(struct rio_info *p, struct tty
 	ttyseth -- set hardware dependent tty settings
 */
 void
-ttyseth(PortP, s, sg)
-struct Port *		PortP;
-struct ttystatics *		s;
-struct old_sgttyb *sg;
+ttyseth(struct Port *PortP, struct ttystatics *s, struct old_sgttyb *sg)
 {
 	struct old_sgttyb *	tsg;
 	struct termios *tp = &s->tm;
@@ -1339,11 +1335,7 @@ struct old_sgttyb *sg;
 				sysv != 0 => (System V): struct termio *sg
 */
 static void
-ttyseth_pv(PortP, s, sg, sysv)
-struct Port *PortP;
-struct ttystatics *s;
-struct termios *sg;
-int sysv;
+ttyseth_pv(struct Port *PortP, struct ttystatics *s, struct termios *sg, int sysv)
 {
     int speed;
     unsigned char csize;


--===============33421825886130785==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33421825886130785==--
