from tkinter import *
import datetime
root = Tk()
root.title("time tracker")

projects = ["0","0","0","0","0"]
programing = [0,0,0,0,0]
researching = [0,0,0,0,0]
breaktime = 0

entry = Entry(root,)
entry.grid(row=0,column=0)
entry.insert(0,"project name")

RB1 = IntVar()
#RB1.get()

frame1 = Frame(root,)
frame1.grid(row=1,column=0)
frame2 = Frame(root,)
frame2.grid(row=2,column=0)
frame3 = Frame(root,bg="white")
frame3.grid(row=3,column=0)
Radiobutton(frame1, text="programing",variable=RB1, value=1).pack()#grid(row=1,column=0)
Radiobutton(frame1, text="Research     ",variable=RB1, value=2).pack()#grid(row=2,column=0)
Radiobutton(frame1, text="Break          ",variable=RB1, value=3).pack()#grid(row=3,column=0)
bre1 = Label(frame1, text="Break Time = " + str(breaktime))
bre1.pack()


def start():
    global projectname
    global startTime
    global cat
    projectname = entry.get()
    if projectname in projects:
        startTime = datetime.datetime.now()
        cat = RB1.get()

    else:
        openspace = projects.index("0")
        projects[openspace] = projectname

        startTime = datetime.datetime.now()
        cat = RB1.get()


def stop():
    global breaktime
    global bre1
    bre1.destroy()
    if cat == 1:
        if programing[projects.index(projectname)] == 0:
            programing[projects.index(projectname)] = (datetime.datetime.now() - startTime)
        else:
            programing[projects.index(projectname)] = programing[projects.index(projectname)]+ (datetime.datetime.now() - startTime)
    if cat == 2:
        if researching[projects.index(projectname)] == 0:
            researching[projects.index(projectname)] = (datetime.datetime.now() - startTime)
        else:
            researching[projects.index(projectname)] = researching[projects.index(projectname)]+(datetime.datetime.now() - startTime)
    if cat == 3:
        if breaktime == 0:
            breaktime = (datetime.datetime.now() - startTime)
        else:
            breaktime = breaktime +(datetime.datetime.now() - startTime)

    proj1 = Label(frame3, text=projects[0], bg="white")
    proj2 = Label(frame3, text=projects[1], bg="white")
    proj3 = Label(frame3, text=projects[2], bg="white")
    proj4 = Label(frame3, text=projects[3], bg="white")
    proj5 = Label(frame3, text=projects[4], bg="white")
    prog1 = Label(frame3, text=str(programing[0])[0:7], bg="white")
    prog2 = Label(frame3, text=str(programing[1])[0:7], bg="white")
    prog3 = Label(frame3, text=str(programing [2])[0:7], bg="white")
    prog4 = Label(frame3, text=str(programing[3])[0:7], bg="white")
    prog5 = Label(frame3, text=str(programing[4])[0:7], bg="white")
    res1 = Label(frame3, text=str(researching[0])[0:7], bg="white")
    res2 = Label(frame3, text=str(researching[1])[0:7], bg="white")
    res3 = Label(frame3, text=str(researching[2])[0:7], bg="white")
    res4 = Label(frame3, text=str(researching[3])[0:7], bg="white")
    res5 = Label(frame3, text=str(researching[4])[0:7], bg="white")

    bre1 = Label(frame1, text="Break Time = " + str(breaktime)[0:7])
    bre1.pack()
    total1 = Label(frame3, text="na", bg="white")
    total2 = Label(frame3, text="na", bg="white")
    total3 = Label(frame3, text="na", bg="white")
    total4 = Label(frame3, text="na", bg="white")
    total5 = Label(frame3, text="na", bg="white")

    proj1.grid(row=1, column=0)
    proj2.grid(row=2, column=0)
    proj3.grid(row=3, column=0)
    proj4.grid(row=4, column=0)
    proj5.grid(row=5, column=0)
    prog1.grid(row=1, column=1)
    prog2.grid(row=2, column=1)
    prog3.grid(row=3, column=1)
    prog4.grid(row=4, column=1)
    prog5.grid(row=5, column=1)
    res1.grid(row=1, column=2)
    res2.grid(row=2, column=2)
    res3.grid(row=3, column=2)
    res4.grid(row=4, column=2)
    res5.grid(row=5, column=2)


    total1.grid(row=1, column=4)
    total2.grid(row=2, column=4)
    total3.grid(row=3, column=4)
    total4.grid(row=4, column=4)
    total5.grid(row=5, column=4)


startbutton = Button(frame2,text="Start",command=start)
stopbutton = Button(frame2,text="Stop",command=stop)
startbutton.grid(row=4,column =0)
stopbutton.grid(row=4,column =1)
mylabel1 = Label(frame3,text="project name   ",fg="blue")
mylabel2 = Label(frame3,text="programing   ",fg="blue")
mylabel3 = Label(frame3,text="research   ",fg="blue")

mylabel5 = Label(frame3,text="total",fg="blue")
mylabel1.grid(row=0, column=0)
mylabel2.grid(row=0, column=1)
mylabel3.grid(row=0, column=2)

mylabel5.grid(row=0, column=4)


root.mainloop()
