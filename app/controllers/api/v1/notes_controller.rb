class Api::V1::NotesController < ApplicationController

    def show
        note = Note.find(params[:id])

        render json: note
    end 

    def index 
        notes = Note.all 

        render json: notes
    end 

    def create

        note = Note.create(note_params)

        render json: note
    end 

    def update
    
        note = Note.find(params[:id])

        note.update(note_params)

        render json: note
    end 

    def destroy
        note = Note.find(params[:id])

        note.destroy

        render json: note 
    end

    private 

    def note_params
        params.require(:note).permit(:title, :content, :author_id)
    end
end
