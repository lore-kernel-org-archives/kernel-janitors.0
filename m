From: "tiob lew" <lewtiob@gmail.com>
Date: Tue, 19 Jun 2007 00:32:54 +0000
Subject: [KJ] Makefile question
Message-Id: <63b6c970706181732y6b21b632yff6af81567ab55f6@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7665117773883959241=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7665117773883959241==
Content-Type: multipart/alternative; 
	boundary="----=_Part_112462_2003114.1182213174479"

------=_Part_112462_2003114.1182213174479
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I have a problem about Makefile and gdb.  I write a program and if I compile
the files by the following command:
g++ -g scheduler.cc generate_task.cc schedule_task.cc energy_storage.cc -o
energy_harvesting_prog

I can debug the program as usual with command " gdb energy_harvesting_prog"



However, when I use Makefile , shown in Appendix 2, for compiling the
program, it seems Makefile automatically ignore option "-g",  shown in
Appendix 3.
Accordingly, I can not debug the program properly, and  the error
information is shown in Appendix 0.


How should I modify Makefile so that the program could be debugged by gdb.


Thank you very much.



##############################                   Appendix 0
############################################

$gdb energy_harvesting_prog
GNU gdb Red Hat Linux (6.3.0.0-1.132.EL3rh)
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "i386-redhat-linux-gnu"...(no debugging symbols
found)
Using host libthread_db library "/lib/tls/libthread_db.so.1".

(gdb) run
Starting program: ~/energy_harvesting_prog
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)


##############################                   Appendix 1
############################################

GCC version

$gcc --version
gcc (GCC) 3.2.3 20030502 (Red Hat Linux 3.2.3-58)
Copyright (C) 2002 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.




For the reference, I also post the Makefile and the prompt information after
running command "make".



##############################                   Appendix 2
############################################
Makefile

CC = g++
LD = g++
CFLAGS = -g -Wall
LDFLAGS = -g
SRCS = scheduler.cc generate_task.cc schedule_task.cc energy_storage.cc
OBJS = scheduler.o generate_task.o schedule_task.o energy_storage.o
PROG = energy_harvesting_prog
RM = /bin/rm -f

$(PROG): $(OBJS)
    $(LD) $(LDFLAGS) $(OBJS) -o $(PROG)
$@: $<
    $(CC) $(CFLAGS) -c $<
clean:
    $(RM) $(OBJS) $(PROG)




##############################          Appendix 3
#############################################
### output after I run make


$ make
g++    -c -o scheduler.o scheduler.cc
g++    -c -o generate_task.o generate_task.cc
g++    -c -o schedule_task.o schedule_task.cc
g++    -c -o energy_storage.o energy_storage.cc
g++ -g   scheduler.o generate_task.o schedule_task.o energy_storage.o  -o
energy_harvesting_prog

##################################################################################################

------=_Part_112462_2003114.1182213174479
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,<br><br>I have a problem about Makefile and gdb.&nbsp; I write a program and if I compile the files by the following command:<br>g++ -g scheduler.cc generate_task.cc schedule_task.cc energy_storage.cc -o energy_harvesting_prog
<br><br>I can debug the program as usual with command &quot; gdb energy_harvesting_prog&quot;<br><br><br><br>However, when I use Makefile , shown in Appendix 2, for compiling the program, it seems Makefile automatically ignore option &quot;-g&quot;,&nbsp; shown in Appendix 3. 
<br>Accordingly, I can not debug the program properly, and&nbsp; the error information is shown in Appendix 0. <br><br><br>How should I modify Makefile so that the program could be debugged by gdb. <br><br><br>Thank you very much.
<br><br><br><br>##############################&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Appendix 0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span>&nbsp; ############################################<br><br>$gdb energy_harvesting_prog<br>GNU gdb Red Hat Linux (
6.3.0.0-1.132.EL3rh)<br>Copyright 2004 Free Software Foundation, Inc.<br>GDB is free software, covered by the GNU General Public License, and you are<br>welcome to change it and/or distribute copies of it under certain conditions.
<br>Type &quot;show copying&quot; to see the conditions.<br>There is absolutely no warranty for GDB.&nbsp; Type &quot;show warranty&quot; for details.<br>This GDB was configured as &quot;i386-redhat-linux-gnu&quot;...(no debugging symbols found)
<br>Using host libthread_db library &quot;/lib/tls/libthread_db.so.1&quot;.<br><br>(gdb) run<br>Starting program: ~/energy_harvesting_prog<br>(no debugging symbols found)<br>(no debugging symbols found)<br>(no debugging symbols found)
<br>(no debugging symbols found)<br>(no debugging symbols found)<br><br><br>##############################&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Appendix 1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span>&nbsp; ############################################
<br><br>GCC version <br><br>$gcc --version<br>gcc (GCC) 3.2.3 20030502 (Red Hat Linux 3.2.3-58)<br>Copyright (C) 2002 Free Software Foundation, Inc.<br>This is free software; see the source for copying conditions.&nbsp; There is NO
<br>warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.<br><br><br><br><br>For the reference, I also post the Makefile and the prompt information after running command &quot;make&quot;.<br><br><br>
<br>##############################&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Appendix 2 &nbsp; &nbsp; &nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; ############################################<br>Makefile<br><br>CC = g++<br>LD = g++<br>CFLAGS = -g -Wall
<br>LDFLAGS = -g<br>SRCS = scheduler.cc generate_task.cc schedule_task.cc energy_storage.cc<br>OBJS = scheduler.o generate_task.o schedule_task.o energy_storage.o<br>PROG = energy_harvesting_prog<br>RM = /bin/rm -f<br><br>
$(PROG): $(OBJS)<br>&nbsp;&nbsp;&nbsp; $(LD) $(LDFLAGS) $(OBJS) -o $(PROG)<br>$@: $&lt;<br>&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) -c $&lt;<br>clean:<br>&nbsp;&nbsp;&nbsp; $(RM) $(OBJS) $(PROG)<br><br><br><br><br>##############################&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;">
 </span><span style="font-weight: bold;">Appendix 3&nbsp; &nbsp; </span><span style="font-weight: bold;">&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #############################################<br>### output after I run make<br><br><br>$ make<br>g++&nbsp;&nbsp;&nbsp; -c -o 
scheduler.o scheduler.cc<br>g++&nbsp;&nbsp;&nbsp; -c -o generate_task.o generate_task.cc<br>g++&nbsp;&nbsp;&nbsp; -c -o schedule_task.o schedule_task.cc<br>g++&nbsp;&nbsp;&nbsp; -c -o energy_storage.o energy_storage.cc<br>g++ -g&nbsp;&nbsp; scheduler.o generate_task.o schedule_task.o energy_storage.o&nbsp; -o energy_harvesting_prog
<br><br>##################################################################################################<br><br><br><br><br><br>

------=_Part_112462_2003114.1182213174479--

--===============7665117773883959241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============7665117773883959241==--
