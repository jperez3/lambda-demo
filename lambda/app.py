""" Lambda Demo """


def super_important_function():
    """ Super Important Function """
    print("WHAT IS GOING ON?!?!")
    print("(╯°□°）╯︵ ┻━┻) ")
    print("")
    print("Oh... It's actually working!")
    print("┳━┳ ヽ(ಠل͜ಠ)ﾉ")
    print("")


def lambda_handler(event, context):
    """ AWS Lambda Handler """
    print("************************************")
    print("EXECUTING LAMBDA HANDLER")
    print("************************************")
    print("")
    super_important_function()

def test_handler(event, context):
    """ AWS Lambda Handler """
    print("************************************")
    print("EXECUTING TEST HANDLER")
    print("************************************")
    print("")
    print("TEST ALL THE THINGS!!!")
